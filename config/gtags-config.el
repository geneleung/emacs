(add-to-list 'load-path "~/.emacs.d/plugin")
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'gtags-select-mode-hook     
  '(lambda ()                         
        (setq hl-line-face 'underline)
        (hl-line-mode 1)              
))                                    
(add-hook 'java-mode-hook
  '(lambda ()                         
        (gtags-mode 1)))              
; Customization                       
(setq gtags-suggested-key-mapping t)  
(setq gtags-auto-update t)            

