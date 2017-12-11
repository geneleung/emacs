(require 'ox-publish)
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
               (if (> (length title) 67)
                   (concat (substring title 0 66) "...")
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
;;(global-set-key "\C-c\C-w" 'rename-current-buffer-with-first-line) 
(add-hook 'org-mode-hook '(lambda ()
                            ;; 取代系统的另存为
                            (local-set-key (kbd "C-x C-w") 'rename-current-buffer-with-first-line)))
;; (defun write-file-with-first-line ()
;;   (interactive)
;;   (write-file
;;    (let ((title (string-trim
;;                  (save-excursion
;;                    (goto-char (point-min))
;;                    (buffer-substring-no-properties (line-beginning-position) (line-end-position))))))
;;      (if (> (length title) 67)
;;          (concat (substring title 0 66) "...")
;;        title))))

(setq org-html-home/up-format
  "<div id=\"org-div-home-and-up\">
 <a accesskey=\"h\" href=\"%s\"> UP </a>
 <a accesskey=\"H\" href=\"%s\"> HOME </a>
<a accesskey=\"H\" href=\"RSS\"> RSS </a>
</div>")
;; (defcustom org-html-postamble-format
;;   '(("en" "<p class=\"author\">Author: %a (%e)</p>
;; <p class=\"date\">Date: %d</p>
;; <p class=\"creator\">%c</p>
;; <p class=\"validation\">%v</p>"))
      
(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/personal/public-notes/"
         :base-extension "org"
         :publishing-directory "~/public_html/"
         :publishing-function org-html-publish-to-html
         :htmlized-source t ;; this enables htmlize, which means that I can use css for code!
         
         :with-author t
         :with-creator nil
         :with-date t

         :headline-level 4
         :recursive t
         :auto-preamble t
         :section-numbers nil
         :with-toc nil
         :with-drawers t
         :with-sub-superscript nil ;; important!!

         ;; the following removes extra headers from HTML output -- important!
         :html-head nil ;; cleans up anything that would have been in there.
         ;;:html-head-extra ,my-blog-extra-head
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-viewport nil

         ;;:html-format-drawer-function my-blog-org-export-format-drawer
         :html-link-up "/index.html"
         :html-link-home "/index.html"

         ;;:html-mathjax-options ,my-blog-local-mathjax
         ;;:html-mathjax-template "<script type=\"text/javascript\" src=\"%PATH\"></script>"
         :html-footnotes-section "<div id='footnotes'><!--%s-->%s</div>"
         ;;:html-preamble my-blog-header
         :html-postamble "<hr />
<p><span style=\"float: left;\"><a href= \"/blog.xml\">RSS</a></span>
License: <a href= \"https://creativecommons.org/licenses/by-sa/4.0/\">CC BY-SA 4.0</a></p>
<p><a href= \"/contact.html\"> Contact</a></p>"

         ;; sitemap - list of blog articles
         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "Blog"
         ;; custom sitemap generator function
         ;;:sitemap-function my-blog-sitemap
         :sitemap-sort-files anti-chronologically
         :sitemap-date-format "Published: %a %b %d %Y"
         )
        ("blog-static"
         :base-directory "~/personal/public-notes/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))
        ))
