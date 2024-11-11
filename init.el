;; -*- lexical-binding: t -*-

; DOES IT REALLY WORK
(setq package-native-compile t)

; FUCKING CUSTOM
(setq custom-file (concat user-emacs-directory "custom.el"))
;(load custom-file 'noerror)

; NO STARTUP SCREEN
(setq inhibit-startup-screen 1)

; SOME SHIT GONE
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

; STOP IT
(setq make-backup-files nil)

; LINE NUMBERS LESSGO
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook
	  (lambda () (display-line-numbers-mode 1)))

; PARENS
(show-paren-mode 1)

; WHAT TO SHOW
(setq whitespace-style '(face spaces empty tabs trailing space-mark tab-mark))

(require 'package)
(package-initialize)

; PACKAGE SOURCES
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

; MY THEME
(unless (package-installed-p 'sublime-themes)
  (package-refresh-contents)
  (package-install 'sublime-themes))

(require 'sublime-themes)
(load-theme 'spolsky 1)

;; (unless (package-installed-p 'timu-rouge-theme)
;;   (package-refresh-contents)
;;   (package-install 'timu-rouge-theme))

;; (require 'timu-rouge-theme)
;; (load-theme 'timu-rouge)

;; WHITESPACES LESSGO
(global-whitespace-mode 1)

;; (setq whitespace-display-mappings
;;       '((space-mark 32 [183] [46])
;;         (newline-mark ?\n [172 ?\n] [36 ?\n])
;;         (newline-mark ?\r [182] [35])
;;         (tab-mark ?\t [8608 ?\t] [62 ?\t])))

(require 'color)
(let* ((ws-lighten 70)
       (ws-color (color-darken-name "grey" ws-lighten)))
   (set-face-foreground 'whitespace-space                  ws-color)
   (set-face-foreground 'whitespace-space-after-tab        ws-color)
   (set-face-foreground 'whitespace-space-before-tab       ws-color)
   (set-face-foreground 'whitespace-tab                    ws-color)
   (set-face-foreground 'whitespace-trailing               ws-color)
   (set-face-background 'whitespace-space                  "#000000ff")
   (set-face-background 'whitespace-space-after-tab        "#000000ff")
   (set-face-background 'whitespace-space-before-tab       "#000000ff")
   (set-face-background 'whitespace-tab                    "#000000ff")
   (set-face-background 'whitespace-trailing               "#000000ff"))

(set-face-foreground 'line-number              "#770096")
(set-face-background 'line-number-current-line "#4a1758")
(set-face-foreground 'line-number-current-line "#c339e9")
(set-face-bold-p 'line-number-current-line 't)

(add-hook 'after-init-hook
	  (lambda () (set-face-attribute 'default nil :family "Fira Code" :height 140)))

;; (add-to-list 'default-frame-alist '(font . "Fira Code") '(height . 160))

; U KNOW IT
(column-number-mode 1)

(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))
(require 'magit)
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
; ----------------------------------------

(defun c-config-hook ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil))

(add-hook 'c-mode-hook 'c-config-hook)

(put 'upcase-region 'disabled nil)

; ----------------------------------------

(unless (package-installed-p 'undo-tree)
  (package-refresh-contents)
  (package-install 'undo-tree))
(require 'undo-tree)

(defun undo-tree-config-hook ()
  (setq undo-tree-auto-save-history nil))

(add-hook 'undo-tree-mode-hook 'undo-tree-config-hook)
(global-undo-tree-mode 1)

; ----------------------------------------

(add-to-list 'load-path "~/.emacs.d/my-stuff/")
(require 'greeting)
(greeting-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

; ----------------------------------------

(require 'ido)
(ido-mode 'buffers)
(defun ido-mode-ignore-buffers (bufs)
  (cond ((null bufs) '())
	('t (save-excursion (add-to-list 'ido-ignore-buffers
					 (car bufs))
			    (ido-mode-ignore-buffers (cdr bufs))))))
(ido-mode-ignore-buffers
 '("*readonly*"
   "*scratch*"
   "*Messages*"
   "*Backtrace*"
   "*Warnings*"
   "*Async-native-compile-log"
   "*Completions*"))
; ----------------------------------------

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

; ----------------------------------------

(unless (package-installed-p 'language-detection)
  (package-refresh-contents)
  (package-install 'language-detection))
(require 'language-detection)

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

; ----------------------------------------
(unless (package-installed-p 'go-translate)
  (package-refresh-contents)
  (package-install 'go-translate))
(require 'go-translate)

(setq gt-langs '(en ru))
(setq gt-default-translator
      (gt-translator
       :engines (list (gt-google-engine) (gt-bing-engine))
       :render  (gt-buffer-render)))

; ----------------------------------------
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
