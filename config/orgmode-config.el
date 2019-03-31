(require 'ox-md)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
;;(add-hook 'visual-fill-column-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
;;(add-hook 'org-mode-hook 'turn-on-auto-fill)
;;(add-hook 'org-mode-hook 'turn-on-iimage-mode)
(add-hook 'org-mode-hook 'org-toggle-inline-images)
;; 设置org文件导出时不带上面那个目录
(setq org-export-with-toc nil)
;;设置图片显示大小为70，同auto-fill mode
(setq org-image-actual-width 600)
;;设置org时间戳用默认的英文格式
(setq system-time-locale "C")
(setq org-log-done 'note)
;;设置状态改变记录，和修改日志放哪里，定义一个drawer
(setq org-log-into-drawer "LOGBOOK")
(setq org-agenda-files '("~/capture.org"))
(setq org-default-notes-file "~/capture.org")
(setq org-archive-location "~/archive::datetree/* From %s")

(setq org-tag-alist '(("工作" . ?w) ("技术" . ?t) ("个人" . ?p)))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/capture.org" "Tasks")
             "* TODO %?\n %U\n  %i")
        ("n" "Note" entry (file+headline "~/capture.org" "Notes")
         "* %U\n %?\n  %i")
        ("T" "带文件链接的Todo" entry (file+headline "~/capture.org" "Tasks")
             "* TODO %?\n  %i\n  %a")))
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/libs/plantuml.1.2017.15.jar"))
(setq org-ditaa-jar-path
      (expand-file-name "~/.emacs.d/libs/ditaa0_9.jar"))
;; 太多取消的情况，所以给TODO都有一个取消的状态
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE(d)" "CANCELED(c)")))
;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (ditaa . t)
   (dot . t)
   (plantuml . t)))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
