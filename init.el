(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")
    ("org" . "https://orgmode.org/elpa/")
    ;;("marmalade" . "http://marmalade-repo.org/packages/")
    ))

(package-initialize)

;; Use Package

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t
      use-package-always-defer t)

(require 'org)
(require 'ob-tangle)
(require 'use-package)

;; Basic

(use-package cl)
(require 'cl)

(defun user/load-configuration ()
  (interactive)
  (org-babel-load-file "~/.emacs.d/README.org"))

(bind-key "C-x p" 'user/load-configuration)

(if (file-exists-p "~/.emacs.d/README.el")
  (load-file "~/.emacs.d/README.el")
  (cl-letf (((symbol-function 'message) #'format))
    (org-babel-load-file (expand-file-name "~/.emacs.d/README.org"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (diff-hl rainbow-mode rainbow-delimiters magit paredit cider projectile zenburn-theme challenger-deep-theme atom-one-dark-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
