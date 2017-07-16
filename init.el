;; liangzhen's emacs24 config
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(define-obsolete-function-alias 'org-define-error 'define-error);;org-page编译时的错误处理
;;set defult loadpath
(add-to-list 'load-path "~/.emacs.d/config")
;; load config
(load "base.el")
(load "elisp-slime-nav-config.el")
(load "org-page-config.el")
;; (load "cc-mode-config.el")
;; (load "ztree.el")
;; (load "ediff-config.el")
;; (load "slime.el")
(load "yasnippet-config.el")
(load "auto-complete-config.el")
;; (load "android-config.el")
;; solarized theme is not as cofortable as it says,but misterioso is more better
;; (load "solarized-theme-config.el")
;; (autoload 'gtags-mode "gtags" "" t)
