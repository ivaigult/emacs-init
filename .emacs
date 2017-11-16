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

(setq url-proxy-services '(("no_proxy" . "work\\.com")
                           ("http"  . "proxy-chain.intel.com:911")
			   ("https" . "proxy-chain.intel.com:911")
			   ("ftp"   . "proxy-chain.intel.com:911")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(setq my-package-list '(
    monokai-theme
    auto-complete
    cmake-mode
    elpy ;; pip install rope, jedi, flake8, importmagic, autopep8 
))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (pkg my-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg))
)

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

(when (package-installed-p 'monokai-theme)
    (load-theme 'monokai t)
)

(when (package-installed-p 'auto-complete)
    (ac-config-default)
)

(when (package-installed-p 'elpy)
    (elpy-enable)
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (elpy cmake-mode auto-complete monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
