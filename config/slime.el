;; Setup load-path, autoloads and your lisp system
;; Not needed if you install SLIME via MELPA
(add-to-list 'load-path "~/.emacs.d/plugin/slime-2.13")
(require 'slime-autoloads)
(setq inferior-lisp-program "~/ccl/scripts/ccl64")
