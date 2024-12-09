(provide 'vash-god-mode-config)

;; TODO:
;; 1. C-x <space> - DONE
;; 2. Completion framework
;; 3. indicate that isearch is now on in god mode - DONE
;; 4. map C-g to exit isearch - DONE
;; 5. back and forth by word with single keystroke - DONE
;; 6. turn off C-x C-c - DONE
;; 7. turn off god mode echoing - DONE
;; 8. till/find like in meow-mode
;; 9. templates for C++

(require 'god-mode)

(god-mode)
(global-set-key (kbd "<escape>")
                (lambda ()
                  (interactive)
                  (let ((inhibit-message t))
                    (god-local-mode 'toggle))))

(setq god-mode-alist
      '((nil . "C-")
        ("m" . "M-")
        ("j" . "C-M-")))

(defun my-god-mode-update-cursor-type ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(add-hook 'post-command-hook #'my-god-mode-update-cursor-type)

(require 'god-mode-isearch)

(define-key isearch-mode-map
            (kbd "<escape>")
            (lambda ()
              (interactive)
              (god-isearch-mode 1)
              (god-mode-isearch-activate)))
(define-key god-mode-isearch-map
            (kbd "<escape>")
            (lambda ()
              (interactive)
              (god-isearch-mode -1)
              (god-mode-isearch-disable)))

(define-key god-mode-isearch-map
            (kbd "g")
            #'isearch-cancel)
(define-key god-mode-isearch-map
            (kbd "e")
            #'isearch-edit-string)

(define-minor-mode god-isearch-mode
  "Minor mode that indicates whether god-mode is active
in isearch-buffer or is it not")

(add-hook 'isearch-mode-hook
          (lambda () (god-isearch-mode -1)))

