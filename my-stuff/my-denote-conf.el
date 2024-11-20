(provide 'my-denote-conf)

(setq denote-known-keywords
      '(programming
        cpp
        c
        ))

(setq denote-directory "~/Zettelkasten")
(setq denote-file-type 'org)
(setq denote-sort-keywords 't)
(setq denote-infer-keywords 't)

(setq denote-templates
      '((permanent-note . "* Body\n\n* References")))

(defun denote-fleeting-note ()
  (declare (interactive-only t))
  (interactive)
  (let* ((denote-prompts (denote-add-prompts '(subdirectory)))
         (denote-use-directory (concat denote-directory "/Fleeting")))
    (call-interactively #'denote)))

(defun denote-permanent-note ()
  (declare (interactive-only t))
  (interactive)
  (let* ((denote-prompts (denote-add-prompts '(template subdirectory)))
         (denote-use-directory (concat denote-directory "/Permanent"))
         (denote-use-template "* Body\n\n* References"))
    (call-interactively #'denote)))

(defun denote-link-after-creating-fleeting-note ()
  (declare (interactive-only t))
  (interactive)
  (denote-link-after-creating-with-command 'denote-fleeting-note))

(defun denote-link-after-creating-permanent-note ()
  (declare (interactive-only t))
  (interactive)
  (denote-link-after-creating-with-command 'denote-permanent-note))

