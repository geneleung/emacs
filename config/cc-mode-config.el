;;=============代码折叠===============
;(hs-minor-mode t)
(add-hook 'c-mode-common-hook 'hs-minor-mode) 
(add-hook 'c++-mode-common-hook 'hs-headline) 
;;========注释
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)
;;==============换行缩进 ================
(defun my-c-cpp-mode-common-hook()
  (c-set-style "linux")
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
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
;;(add-hook 'c-mode-common-hook 'my-c-cpp-mode-common-hook)
;; (add-hook 'c++-mode-common-hook 'my-c-cpp-mode-common-hook)
;;;end
