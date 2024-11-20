(provide 'vash-mode-line-config)

(defvar-local vash-mode-line-buffer-icon
    (propertize "" 'face 'warning))

(defvar-local vash-mode-line-buffer-name-indicator
    '(:eval
      (propertize (buffer-name) 'face 'bold)))

(defvar-local vash-mode-line-file-changed-indicator
    '(:eval
      (if (buffer-modified-p)
          (propertize "***" 'face 'error)
          (propertize "---" 'face 'success))))

(defvar-local vash-mode-line-major-mode-indicator
    '(:eval
      (propertize (substring-no-properties (format-mode-line mode-name))
                  'face
                  'empty)))

(defvar-local vash-mode-line-input-method-icon
    (propertize "" 'face 'warning))

(defvar-local vash-mode-line-input-method-indicator
    '(:eval
      (propertize
       (if current-input-method-title
           current-input-method-title
         "DEFAULT")
       'face
       'bold)))

(let ((variable-list
       (list 'vash-mode-line-buffer-icon
             'vash-mode-line-file-changed-indicator
             'vash-mode-line-buffer-name-indicator
             'vash-mode-line-major-mode-indicator
             'vash-mode-line-input-method-icon
             'vash-mode-line-input-method-indicator
             )))
  (mapc (lambda (var) (put var 'risky-local-variable t))
        variable-list))

(setq-default mode-line-format
              '(" "
                vash-mode-line-buffer-icon
                " "
                vash-mode-line-file-changed-indicator
                " : "
                vash-mode-line-buffer-name-indicator
                " "
                "("
                vash-mode-line-major-mode-indicator
                ")"
                " "
                vash-mode-line-input-method-icon
                " : "
                vash-mode-line-input-method-indicator
                ))
