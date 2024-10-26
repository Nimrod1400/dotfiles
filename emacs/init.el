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
	  (lambda () (display-line-numbers-mode 1)
	    (local-set-key (kbd "C-c c") (lambda () (interactive)
					   (save-excursion (switch-to-buffer "*compilation*")
							   (compile compile-command))))))

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

(defun c++-config-hook ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil))

(add-hook 'c++-mode-hook 'c++-config-hook)
