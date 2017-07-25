(add-to-list 'load-path
             "~/.emacs.d/plugin/org-page")
(require 'org-page)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-iimage-mode)
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

(setq op/repository-directory "/var/git/public-notes")   ;; the repository location
(setq op/site-domain "http://www.iknockdoor.com/")         ;; your domain
(setq op/theme 'kactus)
;;(setq op/theme 'mdo)
(setq op/site-main-title "I Knock Door")
(setq op/site-sub-title "这并不是一个博客，只是一个笔记本")
(setq op/repository-org-branch "master") ;; default is "source",这里我用主分支
(setq op/repository-html-branch "html")  ;; default is "master",这里我用html，其实这里可以不设置，因为我是直接publish到指定目录的，不用分支，不过为了防止冲突还是设置成和master不一样的
(setq op/personal-github-link "https://geneleung.github.io")
(setq user-full-name "chappie")
(setq user-mail-address "liangzhen.me@gmail.com")
