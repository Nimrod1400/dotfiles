(provide 'vash-greeting)

(defun vash-open-greeting-buffer ()
  (let ((buf (get-buffer-create "*readonly*")))
    (with-current-buffer buf
      (insert-file "~/Pictures/back.png")
      (image-mode)
      (switch-to-buffer buf))))

