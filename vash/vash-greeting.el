(provide 'vash-greeting)

(defun vash-open-greeting-buffer ()
  (let ((buf (get-buffer-create "*readonly*")))
    (with-current-buffer buf
      (insert-file (concat user-emacs-directory
                           "pictures/greering_background.png"))
      (image-mode)
      (switch-to-buffer buf))))

