(provide 'greeting)

(defun greeting-buffer ()
  (let ((buf (get-buffer-create "*readonly*")))
    (with-current-buffer buf
      (insert "\n\n\n\n\n\n\n\n\n")
      (insert (shell-command-to-string "cat ~/Documents/lain"))
      (face-remap-add-relative 'default :family "FreeMono" :height 140 :weight 'bold)
      (read-only-mode 1)
      (goto-line 1)
      (make-local-variable 'cursor-type)
      (setq cursor-type nil))
    (switch-to-buffer buf)))
