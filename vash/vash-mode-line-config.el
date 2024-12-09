(provide 'vash-mode-line-config)

(defvar-local vash-mode-line-spacer "  ")

(defvar-local vash-mode-line-meow-icon
  (propertize "" 'face 'warning))

(defvar-local vash-mode-line-meow-mode-indicator
      '(:eval
        (when (mode-line-window-selected-p)
          (let* ((state (meow--current-state))
                 (state-name (meow--get-state-name state))
                 (state-name-faced (propertize state-name
                                               'face
                                               'bold)))
            (concat vash-mode-line-meow-icon
                    " : "
                    state-name-faced)))))

(defvar-local vash-mode-line-god-mode-indicator
    '(:eval
      (if god-local-mode
          (propertize "GOD" 'face '((t :inherit 'success :inherit 'italic)))
        (propertize "MAN" 'face '((t :inherit 'warning :inherit 'italic))))))

(defvar-local vash-mode-line-buffer-name-indicator
    '(:eval
      (propertize (buffer-name) 'face 'bold)))

(defvar-local vash-mode-line-file-changed-indicator
    '(:eval
      (if (buffer-modified-p)
          (propertize "W" 'face 'error)
          (propertize "V" 'face 'success))))

(defvar-local vash-mode-line-major-mode-indicator
    '(:eval
      (when (mode-line-window-selected-p)
        (concat
         "("
         (propertize (substring-no-properties (format-mode-line mode-name))
                     'face
                     nil)
         ")"))))

(defvar-local vash-mode-line-optional-input-method
    '(:eval
      (when (and (mode-line-window-selected-p)
                 current-input-method)
        (concat vash-mode-line-spacer
                (propertize "" 'face 'success)
                " : "
                (propertize (if current-input-method-title
                                current-input-method-title
                              "DEFAULT")
                            'face
                            'bold)))))

(defvar-local vash-mode-line-isearch-indicator
    '(:eval
      (when isearch-mode
        (concat
         vash-mode-line-spacer
         (propertize "isearch" 'face 'success)
         (if god-isearch-mode
             (propertize "-/GOD" 'face 'warning)
           (propertize "-mode" 'face 'error))))))

(let ((risky-variables-list
       (list 'vash-mode-line-isearch-indicator
             'vash-mode-line-god-mode-indicator
             ;; 'vash-mode-line-meow-mode-indicator
             'vash-mode-line-spacer
             'vash-mode-line-buffer-icon
             'vash-mode-line-file-changed-indicator
             'vash-mode-line-buffer-name-indicator
             'vash-mode-line-major-mode-indicator
             'vash-mode-line-optional-input-method)))
  (mapc (lambda (var) (put var 'risky-local-variable t))
        risky-variables-list))

(setq-default mode-line-format
              '(" "
                vash-mode-line-god-mode-indicator
                vash-mode-line-spacer
                vash-mode-line-file-changed-indicator
                " : "
                vash-mode-line-buffer-name-indicator
                " "
                vash-mode-line-major-mode-indicator

                vash-mode-line-optional-input-method
                vash-mode-line-isearch-indicator
                " "
                ))
