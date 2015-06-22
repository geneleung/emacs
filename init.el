;; liangzhen's emacs24 config
;;set defult loadpath
(add-to-list 'load-path "~/.emacs.d/config")
;; load config
(load "base.el")
(load "cc-mode-config.el")
(load "ztree.el")
(load "ediff-config.el")
(load "slime.el")
(load "yasnippet-config.el")
(load "auto-complete-config.el")
(load "android-config.el")
;; solarized theme is not as cofortable as it says,but misterioso is more better
;; (load "solarized-theme-config.el")

(autoload 'gtags-mode "gtags" "" t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(indent-tabs-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
