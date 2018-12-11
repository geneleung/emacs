;; 这里参考的原始版本 https://fanpengkong.com/2016/09/elisp-start/
(global-set-key "\C-c\C-f" 'pelican-new-blog)
(defun pelican-new-blog (filename &optional wildcards)
  (interactive
   (find-file-read-args "Find file: "
                        (confirm-nonexistent-file-or-buffer)))
  (let ((value (find-file-noselect filename nil nil wildcards)))
    (if (listp value)
	(mapcar 'switch-to-buffer (nreverse value))
      (switch-to-buffer value))
    (goto-char 1)
    (insert (format "#+TITLE: %s\n" (file-name-base filename)))
    (insert (format "#+DATE: %s\n" (format-time-string "%Y-%m-%d %H:%M:%S %z")))
    (insert "#+CATEGORY: \n")
    (insert "#+PROPERTY: TAGS \n")
    (insert "#+OPTIONS: toc:nil num:nil ^:nil\n")
    (insert "#+BEGIN_PREVIEW \n\n#+END_PREVIEW\n")
    (goto-char (point-min))
    (end-of-line)
    ))
