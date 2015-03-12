;;set vc-mode compare filse use ediff
(eval-after-load "vc-hooks" '(define-key vc-prefix-map "=" 'vc-ediff))
;;set ediff view default horizontally
(setq ediff-split-window-function (quote split-window-horizontally))
