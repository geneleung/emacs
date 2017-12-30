(add-to-list 'load-path "~/.emacs.d/plugin")
(require 'ox-publish)
(require 'htmlize)

;; org导出html时换行不出现空格
(defadvice org-html-paragraph (before org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let* ((origin-contents (ad-get-arg 1))
         (fix-regexp "[[:multibyte:]]")
         (fixed-contents
          (replace-regexp-in-string
           (concat
            "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))

    (ad-set-arg 1 fixed-contents)))

(defun rename-current-buffer-with-first-line ()
  "用当前buffer的第一行内容重命名当前buffer和与他关联的文件
如果第一行内容超过67个字符，自动截取前67个字符并补充...
最后以.org扩展名结尾
"
  (interactive)
  (let* ((name (buffer-name))
         (filename (buffer-file-name))
         (basename (file-name-nondirectory filename)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name
             (concat
             (let ((title (string-trim
                           (save-excursion
                             (goto-char (point-min))
                             (buffer-substring-no-properties (line-beginning-position) (line-end-position))))))
               (if (> (length title) 10)
                   (concat (substring title 0 9) "...")
                 title))
             ".org")
             ))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(add-hook 'org-mode-hook '(lambda () ;;如果是在编辑org mode下，取代系统的另存为
                            (local-set-key (kbd "C-x C-w") 'rename-current-buffer-with-first-line)))
(setq org-html-metadata-timestamp-format "") ;;生成的html文件不带注释的时间戳，每次重新生成时时间戳不同，导致会有一次版本控制的提交
(setq org-html-htmlize-output-type 'css)
(setq org-html-home/up-format
  "<div id=\"org-div-home-and-up\">
 <a accesskey=\"h\" href=\"%s\"> UP </a>
|
 <a accesskey=\"H\" href=\"%s\"> HOME </a>
|
<a accesskey=\"H\" href=\"\"> RSS </a>
</div>")
      
(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/personal/public-notes/"      ;;源文件目录
         :base-extension "org"
         :publishing-directory "~/personal/public-html/" ;;生成文件目录
         :publishing-function org-html-publish-to-html
         :htmlized-source t ;; this enables htmlize, which means that I can use css for code!
         
         :with-author nil
         :with-creator nil
         :with-date nil

         :headline-level 4
         :recursive t
         :auto-preamble t
         :section-numbers nil
         :with-toc nil
         :with-drawers t
         :with-sub-superscript nil ;; important!!

         ;; the following removes extra headers from HTML output -- important!
         :html-head nil ;; cleans up anything that would have been in there.
         :html-head-extra "<meta name='viewport' content='width=device-width,initial-scale=1'><link rel='stylesheet' href='res/code.css' /><link rel='stylesheet' href='res/solarized-light.min.css' />"
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-viewport nil

         ;;:html-format-drawer-function my-blog-org-export-format-drawer
         :html-link-up "http://www.iknockdoor.com/"
         :html-link-home "http://www.iknockdoor.com/"

         ;;:html-mathjax-options ,my-blog-local-mathjax
         ;;:html-mathjax-template "<script type=\"text/javascript\" src=\"%PATH\"></script>"
         :html-footnotes-section "<div id='footnotes'><!--%s-->%s</div>"
         ;;:html-preamble my-blog-header
         :html-postamble "
<div id=\"org-div-home-and-up\">
 <a href=\"/index.html\"> 返回目录 </a>
</div>
<p class=\"author\">by chappie (iknockdoor.com@gmail.com)</p>\n<p class=\"creator\">%c</p>
"

         ;; sitemap - list of blog articles
         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "笔记"
         ;; custom sitemap generator function
         ;;:sitemap-function my-blog-sitemap
         :sitemap-sort-files anti-chronologically
         ;;下面两个要点
         ;;1.format的字符串是生成到index.org，再生成，插入html标签可以按org语法转义
         ;;2.%d的span一定要写在前面才能实现当前的效果
         :sitemap-file-entry-format  "@@html:<span class='timestamp'>@@%d@@html:</span>@@ %t"
         :sitemap-date-format "%Y-%m-%d"
         )
        ("blog-static"
         :base-directory "~/personal/public-notes/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|xz"
         :publishing-directory "~/personal/public-html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))
        ))
