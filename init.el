
;; Startup
(setq inhibit-splash-screen t ;;prevents the default welcom screen
      inhibit-startup-message t);;hide the startup message (usually annoying)

;; Package (configures the repository system)
(require 'package);; source of plugins in emacs
(setq package-archives ;;set the source of remote directories
      '(("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.org/packages/"))
      package-user-dir 
      (concat user-emacs-directory ".archives");;sets the local archive path
      package-check-signature t) ;;ensure packages are correct
(unless package-archive-contents;;check the avialable local archive
  (package-refresh-contents));;updates the package archives
(package-initialize);; initializes the package package

;; Use-package bootstrap (use-package is macro for configuring other packages)
(unless (package-installed-p 'use-package);;check if use package exsists
  (package-install 'use-package));; automatically install usepackage
(setq use-package-always-ensure t);;
;;

;; Backups (and recovery disabled) 
(setq backup-inhibited t ;;inhibits backups
      make-backup-files nil ;;prevent backup files 
      auto-save-list-file-prefix nil ;;prevents auto-save-history directory
      auto-save-default nil)

;; UI (sets up frame)
(when (display-graphic-p);;when graphical interface
;maximise frame realest
  (scroll-bar-mode 0);;remove the scroll bar
  (tool-bar-mode 0);;disables the tool-bar
  (menu-bar-mode 0));;disables the menu-bar

;; Window geometry (prevents a 'white' line from appearing)
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 90))

;;Cursor 
(progn
  (setq default-cursor-type 'box)
  (blink-cursor-mode 0))

;;Scrolling 
(setq scroll-step           1
      scroll-conservatively 10000)

;;Insertion (writing over text is anoying af)
(overwrite-mode 0)


;; Server (impoved startup timing) 
(server-start);;starts the emacs --daemond
;Increase the garbage collection threshold (500mb)
(setq gc-cons-threshold (* 500 1024 1024))

;; UTF-8 encoding
; make sure that UTF-8 (unicode) is used everywhere
(prefer-coding-system        'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-language-environment    'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system   'utf-8)



;; Org-bable setup for mordern ORG config
(use-package org
  :ensure t ;;make sure its install (usually a default package)
  :config
  ;fix indentation problem with code blocks
  (setq org-src-preserve-indentation nil 
	org-edit-src-content-indentation nil)
  ;fix syntax native for native syntax highlighting and tabs
  (setq org-src-fontify-natively t
	org-src-tab-acts-natively t))
  ;; Load config.org -> Emacs configuration (with in a org document)
(org-babel-load-file (concat user-emacs-directory "config.org"))

