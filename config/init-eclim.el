(add-to-list 'load-path "~/.emacs.d/plugin/auto-complete-1.3.1")
(add-to-list 'load-path "~/.emacs.d/plugin/s")
(add-to-list 'load-path "~/.emacs.d/plugin/eclim")
(require 's)
(require 'eclim)
(require 'eclimd)
(global-eclim-mode)

(custom-set-variables
 '(eclim-executable '"~/eclipse/eclim"))
(custom-set-variables
 '(eclimd-executable '"~/eclipse/eclimd"))
(custom-set-variables
 '(eclim-eclipse-dirs '"~/eclipse"))

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

