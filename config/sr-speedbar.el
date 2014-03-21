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
