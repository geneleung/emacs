(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;;设置org时间戳用默认的英文格式
(setq system-time-locale "C")
(setq org-log-done 'note)
;;设置状态改变记录，和修改日志放哪里，定义一个drawer
(setq org-log-into-drawer "LOGBOOK")
(setq org-agenda-files '("~/personal/work-notes"))
(setq org-default-notes-file "~/personal/work-notes/capture.org")

(setq org-tag-alist '(("工作" . ?w) ("技术" . ?t) ("个人" . ?p)))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/personal/work-notes/capture.org" "Tasks")
             "* TODO %?\n %U\n  %i")
        ("n" "Note" entry (file "~/personal/work-notes/capture.org")
         "* %U\n %?\n  %i")
        ("T" "带文件链接的Todo" entry (file+headline "~/personal/work-notes/capture.org" "Tasks")
             "* TODO %?\n  %i\n  %a")))
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/libs/plantuml.1.2017.15.jar"))
;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (ditaa . t)
   (dot . t)
   (plantuml . t)))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
