;; -*- lexical-binding: t -*-

(setq package-native-compile t)

(setq custom-file (concat user-emacs-directory "garbage/custom.el"))
;(load custom-file 'noerror)

(setq inhibit-startup-screen 1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

(setq make-backup-files nil)

(put 'upcase-region 'disabled nil)

(add-hook 'after-init-hook
	  (lambda ()
	    (set-face-attribute 'default nil :family "Fira Code" :height 140)))

(setq whitespace-style
      '(face tabs spaces
	    trailing lines space-before-tab indentation empty
	    space-after-tab space-mark tab-mark missing-newline-at-eof))

(global-whitespace-mode 1)

(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook
	  (lambda () (display-line-numbers-mode 1)))

(show-paren-mode 1)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'load-path (concat user-emacs-directory "modus-themes"))
(require 'modus-themes)

(mapc #'disable-theme custom-enabled-themes)

;;--------------------------
;; MODE LINE CONFIGURATION |
;;--------------------------

(defface my-mode-line-file-changed
  '((t :foreground "#7f0f3a" :inherit bold))
  "Face with red foreground indicating that file has changed.")

(defface my-mode-line-file-not-changed
  '((t :foreground "#3a7f0f" :inherit bold))
  "Face with green foreground indicating that file has not changed.")

(defvar-local my-mode-line-buffer-name
    '(:eval
      (propertize (buffer-name) 'face 'bold)))

(defvar-local my-mode-line-file-changed-indicator
    '(:eval
      (if (buffer-modified-p)
	  (propertize "***" 'face 'my-mode-line-file-changed)
	(propertize "---" 'face 'my-mode-line-file-not-changed))))

(put 'my-mode-line-buffer-name 'risky-local-variable t)
(put 'my-mode-line-file-changed-indicator 'risky-local-variable t)

(setq-default mode-line-format
	      '(" "
		" "
		my-mode-line-file-changed-indicator
		" : "
		my-mode-line-buffer-name))

(setq modus-themes-common-palette-overrides
      '((fg-line-number-inactive "gray50")
        (fg-line-number-active fg-main)
        (bg-line-number-inactive unspecified)
        (bg-line-number-active unspecified)
        (border-mode-line-active bg-mode-line-active)
        (border-mode-line-inactive bg-mode-line-inactive)
        (fringe unspecified)))

(load-theme 'modus-vivendi :no-confirm)

(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))
(require 'magit)
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

(defun c-config-hook ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil))

(add-hook 'c-mode-hook 'c-config-hook)

(unless (package-installed-p 'undo-tree)
  (package-refresh-contents)
  (package-install 'undo-tree))
(require 'undo-tree)

(defun undo-tree-config-hook ()
  (setq undo-tree-auto-save-history nil))

(add-hook 'undo-tree-mode-hook 'undo-tree-config-hook)
(global-undo-tree-mode 1)

(add-to-list 'load-path (concat user-emacs-directory "my-stuff"))
(require 'greeting)
(greeting-buffer)

(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")
(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'ido)
(ido-mode 'buffers)

(defun ido-mode-ignore-buffers (lst-of-buffers)
  (setq ido-ignore-buffers (append ido-ignore-buffers lst-of-buffers)))

(ido-mode-ignore-buffers
 '("*readonly*"
   "*scratch*"
   "*Messages*"
   "*Backtrace*"
   "*Warnings*"
   "*Async-native-compile-log"
   "*Completions*"))

(unless (package-installed-p 'ggtags)
  (package-refresh-contents)
  (package-install 'ggtags))
(require 'ggtags)

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g d") 'ggtags-find-definition)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(unless (package-installed-p 'language-detection)
  (package-refresh-contents)
  (package-install 'language-detection))
(require 'language-detection)

(add-to-list 'load-path (concat user-emacs-directory "eww-language-detection"))
(require 'eww-language-detection)

(setq
 shr-use-fonts  nil
 shr-indentation 10)

(defun my/open-cppreference-headers ()
  (interactive)
  (eww-open-file "~/Documents/cppreference/reference/en/index.html"))

(defun c++-config-hook ()
  (setq c-basic-offset 4)
  (setq c-ts-mode-indent-offset 4)
  (setq c-ts-mode-indent-style 'k&r)
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "C-c C-r") 'my/open-cppreference-headers))

(add-hook 'c++-mode-hook 'c++-config-hook)
(add-hook 'c++-ts-mode-hook 'c++-config-hook)

(unless (package-installed-p 'go-translate)
  (package-refresh-contents)
  (package-install 'go-translate))
(require 'go-translate)

(setq gt-langs '(en ru))
(setq gt-default-translator
      (gt-translator
       :engines (list (gt-google-engine) (gt-bing-engine))
       :render  (gt-buffer-render)))

(unless (package-installed-p 'pdf-tools)
  (package-refresh-contents)
  (package-install 'pdf-tools))
(require 'pdf-tools)
(setq pdf-view-midnight-colors '("#ffffff" . "#101015"))

(unless (package-installed-p 'elfeed)
  (package-refresh-contents)
  (package-install 'elfeed))
(require 'elfeed)

(require 'my-elfeed-conf)
