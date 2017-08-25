;;=====================================
;; 系统外观配置 begin
;;=====================================
;;===emacs 24版nil无效，需要用0
(menu-bar-mode 0);隐藏菜单栏
(tool-bar-mode 0)
;(global-linum-mode 1)
(column-number-mode 1)
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
;; 设置自动换行
(set-default 'truncate-lines t)
(setq default-directory "~/")
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
