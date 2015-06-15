;; liangzhen's emacs24 config
;;set defult loadpath
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/plugin")
;; load config
(load "base.el")
;;(load "ctab.el")
;;(load "sr-speedbar.el")
(load "cc-mode-config.el")
(load "ztree.el")
(load "psvn-config.el")
(load "ediff-config.el")
(load "slime.el")
(autoload 'gtags-mode "gtags" "" t)
;; (load "auto-complete-clang.el")
;;(load "init-eclim.el")
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
