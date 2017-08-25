;; Enable plantuml-mode for PlantUML files
(add-to-list 'load-path "~/.emacs.d/plugin/")
;;(require 'plantuml-mode)
(load "plantuml-mode-20170819.1033.el")
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
(setq plantuml-jar-path "~/.emacs.d/libs/plantuml.1.2017.15.jar")
