;;=====================================
;; 系统外观配置 begin
;;=====================================
;;===emacs 24版nil无效，需要用0
(menu-bar-mode -1);隐藏菜单栏
;;(tool-bar-mode t)
;(global-linum-mode 1)
;(column-number-mode 1)
;(global-ede-mode 1)

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
;;=======================
;;open global ede mode
;;=======================
;;(global-ede-mode t)
;;===================
;;global key bingding
;;==================
;(define-key global-map (kbd "C-RET") 'set-mark-command)
;(define-key global-map (kbd "M-RET") 'mark-word)
;; remind kbd < and else diffrent
(global-set-key (kbd "M-RET") 'mark-word)
(global-set-key (kbd "<C-return>") 'set-mark-command)
(setq tags-table-list '("~/.emacs.d" "~/workspace/opensource/emacs-24.3/lisp"))
