;; 最简配置，只为了org-publish
(setq backup-inhibited 1)
(setq auto-save-default 0)
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;;set defult loadpath
(add-to-list 'load-path "~/.emacs.d/config")

(load "orgmode-config.el")
(load "org-blog-config.el")
(load "org-download-config.el")
(load "plantuml.el")
;; (load "android-config.el")
;; solarized theme is not as cofortable as it says,but misterioso is more better
;; (load "solarized-theme-config.el")
;; (autoload 'gtags-mode "gtags" "" t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (async plantuml-mode ))))
