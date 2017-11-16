;;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;;                    Version 2, December 2004
;; 
;; Copyright (C) 2017 Ivan Vaigult (i.vaigult@gmail.com)
;; 
;; Everyone is permitted to copy and distribute verbatim or modified
;; copies of this license document, and changing it is allowed as long
;; as the name is changed.
;; 
;;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;;   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
;; 
;;  0. You just DO WHAT THE FUCK YOU WANT TO.

;; Disable annoying stuff
(tool-bar-mode 0)
(menu-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(delete-selection-mode t)
(global-auto-revert-mode t)

;; Enable disabled features
(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)

;; Face customization
(set-face-attribute 'default nil :height 100)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(setq my-package-list '(
    company
    monokai-theme
    cmake-mode
    ;; elpy ;; pip install rope, jedi, flake8, importmagic, autopep8 
))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (pkg my-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg))
)

;; Packages setup
(when (package-installed-p 'company)
    (add-hook 'after-init-hook 'global-company-mode)
)

(when (package-installed-p 'monokai-theme)
    (load-theme 'monokai t)
)

(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)
