(add-to-list 'load-path "~/.emacs.d/plugin/android")
(add-to-list 'load-path "~/.emacs.d/plugin/android-mode")
(require 'android-mode)
(custom-set-variables
 '(android-mode-builder (quote gradle))
 '(android-mode-sdk-dir "~/android_sdk"))
