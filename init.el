;; Package Setup
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

;; Customization startup
(setq inhibit-startup-message t) ;; hide the startup message (usually annoying)

;; Window
