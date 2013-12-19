;; liangzhen's emacs24 config
;;set defult loadpath
(add-to-list 'load-path "~/.emacs.d/plugin")
;;=====================================
;; 系统外观配置 begin
;;=====================================
;;===emacs 24版nil无效，需要用0
(menu-bar-mode 1);隐藏菜单栏
(tool-bar-mode 1)
(global-linum-mode 1)
(column-number-mode 1)
(global-ede-mode 1)

;(display-time-mode t)
;(setq display-time-24hr-format t)
;(setq display-time-day-and-dpate t)

;;====================================
;; 系统功能配置 begin
;;===================================
(setq backup-inhibited 1)
(setq auto-save-default 0)
(desktop-save-mode t)
(global-font-lock-mode 1)

;;==================================
;;ctab
;;==================================
(add-to-list 'load-path "~/.emacs.d/plugin/ctab")
(require 'ctab)
(ctab-mode t)

;;===================================
;;sr-speedbar begin
;;==================================
(add-to-list 'load-path "~/.emacs.d/plugin/sr-speedbar") 
(require 'sr-speedbar)
;(require 'speedbar-extension)
(setq sr-speedbar-right-side 0)
(setq sr-speedbar-width 30)
(setq speedbar-show-unknown-files t)
(sr-speedbar-open)



;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;;(when
;;    (load
;;     (expand-file-name "~/.emacs.d/elpa/package.el"))
;;  (package-initialize))
;;(put 'upcase-region 'disabled nil)
;;(put 'downcase-region 'disabled nil)
;;(require 'cedet)
;;(global-ede-mode t)
;; smart complitions
;;(require 'semantic/ia)
;;(setq-mode-local c-mode semanticdb-find-default-throttle
;;                 '(project unloaded system recursive))
;;(setq-mode-local c++-mode semanticdb-find-default-throttle
;;                 '(project unloaded system recursive))
;;=============代码折叠===============
;(hs-minor-mode t)
(add-hook 'c-mode-common-hook 'hs-minor-mode) 
(add-hook 'c++-mode-common-hook 'hs-headline) 
;;=============auto-complete================
;; (setq exec-path  
;;         (cons 
;; 	 "~/.emacs.d/extra-bin/clang+llvm-3.1-x86_64-linux-ubuntu-11.10/bin" exec-path))
(add-to-list 'load-path "~/.emacs.d/plugin/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugin/auto-complete-1.3.1/ac-dict")
(ac-config-default)

;; (add-to-list 'load-path "~/.emacs.d/plugin/auto-complete-clang/")

;; (require 'auto-complete-clang)  
;; (setq ac-clang-auto-save t)  
;; (setq ac-auto-start t)  
;; (setq ac-quick-help-delay 0.5)  
;; ;; (ac-set-trigger-key "TAB")  
;; ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)  
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)  
;; (defun my-ac-config ()  
;;   (setq ac-clang-flags  
;;         (list   
;; 		"/usr/include/c++/4.6"
;; 		"/usr/include/c++/4.6/x86_64-linux-gnu/."
;; 		"/usr/include/c++/4.6/backward"
;; 		"/usr/lib/gcc/x86_64-linux-gnu/4.6.1/include"
;; 		"/usr/local/include"
;; 		"/usr/lib/gcc/x86_64-linux-gnu/4.6.1/include-fixed"
;; 		"/usr/include/x86_64-linux-gnu"
;; 		"/usr/include"
;; 		"~/android/ZJ-CTC/hi3716M/ics/frameworks/base/include/utils"
;; 		"~/android/ZJ-CTC/hi3716M/ics/vendors/skyworth/apps/Skiptv4.0/libs/skplayer/include"))
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
;;   ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)  
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)  
;;   (global-auto-complete-mode t))
;; (defun my-ac-cc-mode-setup ()  
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ;; ac-source-gtags  
;; (my-ac-config)  

;;end
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
;;==================== ecb ===============
;; (add-to-list 'load-path "~/.emacs.d/plugin/ecb-2.40")
;; (setq stack-trace-on-error t)
;; (semantic-mode t)
;; (require 'semantic/ia)
;; ;; ;; 解决Cannot open load file: semantic-ctxt
;; (require 'semantic/analyze)
;; (provide 'semantic-analyze)
;; (provide 'semantic-ctxt)
;; (provide 'semanticdb)
;; (provide 'semanticdb-find)
;; (provide 'semanticdb-mode)
;; (provide 'semantic-load)
;; (require 'ecb-autoloads)
;; (ecb-activate)
;; (ecb-byte-compile)
;; (require 'ecb)

;; (setq ecb-auto-activate t)
;; (setq ecb-tip-of-the-day nil)

;; ;;;; 各窗口间切换
;; ;(global-set-key [M-left] 'windmove-left)
;; ;(global-set-key [M-right] 'windmove-right)
;; ;(global-set-key [M-up] 'windmove-up)
;; ;(global-set-key [M-down] 'windmove-down)
 
;; ;;;; 隐藏和显示ecb窗口
;; (define-key global-map [(f5)] 'ecb-hide-ecb-windows)
;; (define-key global-map [(f6)] 'ecb-show-ecb-windows)
;;end
;;;==============换行缩进 ================
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
;;;end
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ede-project-directories (quote ("/Users/liangzhen/Progrem/testede/include" "/Users/liangzhen/Progrem/testede/src" "/Users/liangzhen/Progrem/testede"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
