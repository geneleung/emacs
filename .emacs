;;hide tool bar
(tool-bar-mode nil)
;;hide menu bar
(menu-bar-mode nil)
;;show line number
(global-linum-mode 'linum-mode)
(add-to-list 'load-path "~/.emacs.d")
;;sr-speedbar begin
(require 'sr-speedbar)
;(require 'speedbar-extension)
;(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 30)
;(setq speedbar-show-unknown-files t)
;;sr-speedbar edn
;;ctab.el
(require 'ctab)
(ctab-mode t)
;;end
;;ede begin
(global-ede-mode t)
;;ede end
(defun my-c-cpp-mode-common-hook()
  (c-set-style "linux")
  (setq c-basic-offset 4)
  ;(c-toggle-auto-hungry-state 1)                             
  (which-function-mode t)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq abbrev-mode t)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?{ > \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  )
(add-hook 'c-mode-common-hook 'my-c-cpp-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-cpp-mode-common-hook)
