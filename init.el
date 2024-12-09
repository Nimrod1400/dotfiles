;; -*- lexical-binding: t -*-

;;-----------------
;; NECESSARY STUFF |
;;-----------------

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.5)

(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 1024 1024 64))))

(setq package-native-compile t)

(setq custom-file (concat user-emacs-directory "garbage/custom.el"))
;(load custom-file 'noerror)

(setq inhibit-startup-screen 1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

(setq echo-keystrokes 0.1)

(setq make-backup-files nil)

(put 'upcase-region 'disabled nil)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'load-path (concat user-emacs-directory "vash"))

(require 'vash-greeting)

;;--------------
;; SOME VISUALS |
;;--------------

(setq my-prefered-max-line-length 80)

(setq whitespace-line-column my-prefered-max-line-length)

(add-hook 'display-fill-column-indicator-mode-hook
          (lambda () (setq fill-column my-prefered-max-line-length)))

(add-hook 'after-init-hook
          (lambda ()
            (set-face-attribute 'default nil :family "iosevka" :height 140)))

(setq whitespace-style
      '(face tabs spaces
             trailing lines space-before-tab indentation empty
             space-after-tab space-mark tab-mark missing-newline-at-eof))

(global-whitespace-mode 1)

;; (setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode 1)
            (display-fill-column-indicator-mode 1)))

(show-paren-mode 1)

;;-------------------------
;; MODE LINE CONFIGURATION |
;;-------------------------

(require 'vash-mode-line-config)

;;----------------------------
;; MODUS THEMES CONFIGURATION |
;;----------------------------

(add-to-list 'load-path (concat user-emacs-directory "modus-themes"))
(require 'modus-themes)

(mapc #'disable-theme custom-enabled-themes)

(require 'vash-modus-themes-config)

(load-theme 'modus-vivendi :no-confirm)
;(load-theme 'modus-operandi :no-confirm)

;;---------------
;; SOME PACKAGES |
;;---------------

(unless (package-installed-p 'cmake-mode)
  (package-refresh-contents)
  (package-install 'cmake-mode))
(require 'cmake-mode)

(unless (package-installed-p 'spacious-padding)
  (package-refresh-contents)
  (package-install 'spacious-padding))
(require 'spacious-padding)

(setq spacious-padding-widths
      '( :internal-border-width 0
         :right-divider-width 20
         :mode-line-width 3) )

(add-hook 'after-init-hook
          (lambda () (spacious-padding-mode 1)))

(unless (package-installed-p 'orderless)
  (package-refresh-contents)
  (package-install 'orderless))
(require 'orderless)

(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

(unless (package-installed-p 'vertico)
  (package-refresh-contents)
  (package-install 'vertico))
(require 'vertico)
(vertico-mode)

(unless (package-installed-p 'marginalia)
  (package-refresh-contents)
  (package-install 'marginalia))
(require 'marginalia)
(marginalia-mode)

(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))
(require 'magit)
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

(unless (package-installed-p 'undo-tree)
  (package-refresh-contents)
  (package-install 'undo-tree))
(require 'undo-tree)

(defun undo-tree-config-hook ()
  (setq undo-tree-auto-save-history nil))

(add-hook 'undo-tree-mode-hook 'undo-tree-config-hook)
(global-undo-tree-mode 1)

(require 'ibuf-ext)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(unless (package-installed-p 'ggtags)
  (package-refresh-contents)
  (package-install 'ggtags))
(require 'ggtags)

(unless (package-installed-p 'language-detection)
  (package-refresh-contents)
  (package-install 'language-detection))
(require 'language-detection)

(add-to-list 'load-path (concat user-emacs-directory "eww-language-detection"))
(require 'eww-language-detection)
(setq shr-use-fonts nil
      shr-indentation 10)

(unless (package-installed-p 'pdf-tools)
  (package-refresh-contents)
  (package-install 'pdf-tools))
(require 'pdf-tools)
(setq pdf-view-midnight-colors '("#ffffff" . "#101015"))

(unless (package-installed-p 'elfeed)
  (package-refresh-contents)
  (package-install 'elfeed))
(require 'elfeed)
(require 'vash-elfeed-conf)

(unless (package-installed-p 'denote)
  (package-refresh-contents)
  (package-install 'denote))
(require 'denote)
(require 'vash-denote-conf)

;;---------------------------------
;; LANGUAGE SPECIFIC CONFIGURATION |
;;---------------------------------

(defun emacs-lisp-config-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-config-hook)

(defun c-config-hook ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil))
(add-hook 'c-mode-hook 'c-config-hook)

;; (keymap-unset c-mode-map "C-c C-a")
;; (define-key c-mode-map (kbd "C-c C-a") nil)
;; (define-key c++-mode-map (kbd "C-c C-a") nil)

(defun c++-config-hook ()
  (ggtags-mode 1)
  (setq c-basic-offset 4)
  (setq c-ts-mode-indent-offset 4)
  (setq c-ts-mode-indent-style 'k&r)
  (setq indent-tabs-mode nil)
  (electric-pair-local-mode 1)
  )

(add-hook 'c++-mode-hook 'c++-config-hook)
(add-hook 'c++-ts-mode-hook 'c++-config-hook)

;;-------------------
;; STUFF FOR RUSSIAN |
;;-------------------

(unless (package-installed-p 'go-translate)
  (package-refresh-contents)
  (package-install 'go-translate))
(require 'go-translate)

(setq gt-langs '(en ru))
(setq gt-default-translator
      (gt-translator
       :engines (list (gt-google-engine) (gt-bing-engine))
       :render  (gt-buffer-render)))

(set-input-method 'russian-computer)
(toggle-input-method)

;;-------------
;; GREET ME :) |
;;-------------

(vash-open-greeting-buffer)

;; ------------
;; KEYBINDINGS |
;; ------------

(keymap-unset global-map "C-x f")
(keymap-set global-map "C-," #'backward-word)

(keymap-unset global-map "C-x C-c")
(keymap-set global-map "C-c C-r" #'rectangle-mark-mode)
(keymap-set global-map "C-." #'forward-word)

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g d") 'ggtags-find-definition)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(global-set-key (kbd "C-x C-1") #'delete-other-windows)
(global-set-key (kbd "C-x C-2") #'split-window-below)
(global-set-key (kbd "C-x C-3") #'split-window-right)
(global-set-key (kbd "C-x C-0") #'delete-window)

;; ---------------
;; NEKO NEKO NEKO |
;; ---------------

; (require 'vash-meow-mode-config)
(require 'vash-god-mode-config)
