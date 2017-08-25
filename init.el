;; liangzhen's emacs24 config
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(define-obsolete-function-alias 'org-define-error 'define-error);;org-page编译时的错误处理
;;set defult loadpath
(add-to-list 'load-path "~/.emacs.d/config")
;; load config
(load "base.el")
(load "orgmode-config.el")
(load "elisp-slime-nav-config.el")
(load "org-page-config.el")
;; (load "cc-mode-config.el")
;; (load "ztree.el")
;; (load "ediff-config.el")
;; (load "slime.el")
(load "yasnippet-config.el")
(ac-config-default)
(load "sr-speedbar-config.el")
;; (load "android-config.el")
;; solarized theme is not as cofortable as it says,but misterioso is more better
;; (load "solarized-theme-config.el")
;; (autoload 'gtags-mode "gtags" "" t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (auto-complete simple-httpd org mustache htmlize git elisp-slime-nav))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "YaHei Consolas Hybrid" :foundry "microsoft" :slant normal :weight normal :height 143 :width normal)))))
;;(put 'narrow-to-region 'disabled nil)
