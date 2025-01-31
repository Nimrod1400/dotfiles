(provide 'vash-mode-line-config)

; TODO: move faces definitions to separate variables, don't inline.

;; (defface vash-mode-line-god-mode-enabled-face
;;   '((t :weight ultra-bold :slant italic :inherit success))
;;     "Face for a string representing enabled god-mode")

;; (defface vash-mode-line-god-mode-disabled-face
;;   '((t :weight bold :slant italic :inherit warning))
;;     "Face for a string representing disabled god-mode")

(defvar-local vash-mode-line-spacer "  ")

;; (defvar-local vash-mode-line-god-mode-indicator
;;     '(:eval
;;       (if god-local-mode
;;           (propertize "† GOD †" 'face 'vash-mode-line-god-mode-enabled-face)
;;         (propertize "_ MAN _" 'face 'vash-mode-line-god-mode-disabled-face))))

(defvar-local vash-mode-line-meow-mode-indicator
    '(:eval (meow-indicator)))

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
             ;; 'vash-mode-line-god-mode-indicator
             'vash-mode-line-meow-mode-indicator
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
                ;; vash-mode-line-god-mode-indicator
                vash-mode-line-meow-mode-indicator
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
