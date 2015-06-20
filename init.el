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
(load "solarized-theme-config.el")

(autoload 'gtags-mode "gtags" "" t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(indent-tabs-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
