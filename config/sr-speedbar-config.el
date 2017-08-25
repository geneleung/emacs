(add-to-list 'load-path "~/.emacs.d/plugin")
(require 'sr-speedbar)
;;默认显示所有文件
(custom-set-variables
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-auto-refresh nil))
;;设置快捷键
;;(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
;;设置固定目录
(add-hook 'speedbar-mode-hook
          (lambda()
            (cd "~/personal/")))
(sr-speedbar-open)
