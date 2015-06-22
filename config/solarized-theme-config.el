;;(add-to-list 'load-path "~/.emacs.d/plugin/solarized-theme")
(add-to-list 'custom-theme-load-path "~/.emacs.d/plugin/solarized-theme")
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
                        (enable-theme 'solarized)))
