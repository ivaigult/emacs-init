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
(when window-system
    (tool-bar-mode 0)
)
(menu-bar-mode 0)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(delete-selection-mode t)
(global-auto-revert-mode t)

;; Make OSX to be suatable for software development
(when (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq ns-function-modifier 'control)
    (global-set-key  (kbd "<end>") 'move-end-of-line)
    (global-set-key  (kbd "<home>") 'move-beginning-of-line)
    (global-set-key  (kbd "<next>") 'forward-paragraph)
    (global-set-key  (kbd "<prior>") 'backward-paragraph)
)

;; Enable disabled features
(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(setq my-package-list '(
    company
    monokai-theme
    cmake-mode
    markdown-mode
    rainbow-mode
    elpy
    emmet-mode
    less-css-mode
    impatient-mode
    yasnippet-snippets
    magit
    go-mode
    tide
))

(unless package-archive-contents
    (package-refresh-contents)
)

(dolist (pkg my-package-list)
  (unless (package-installed-p pkg)
    (package-install pkg))
)

;; Packages setup
(when (package-installed-p 'company)
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key  (kbd "M-?") 'company-complete)
)

(when (package-installed-p 'monokai-theme)
    (load-theme 'monokai t)
)

(when (package-installed-p 'elpy)
    (require 'elpy)
    (setq
        elpy-modules
        (remove 'elpy-module-highlight-indentation elpy-modules))
    (elpy-enable)
)

(when (package-installed-p 'rainbow-mode)
    (add-hook 'css-mode-hook 'rainbow-mode)
)

(when (package-installed-p 'emmet-mode)
    (add-hook 'sgml-mode-hook 'emmet-mode)
    (add-hook 'css-mode-hook  'emmet-mode)
)

(when (package-installed-p 'yasnippet-snippets)
    (yas-global-mode)
    (global-set-key  (kbd "C-j") 'yas-expand)
)

(when (package-installed-p 'tide)
    (defun tide-ts-hook ()
        (tide-setup)
	(flycheck-mode +1)
	(setq flycheck-check-syntax-automatically '(save mode-enabled))
	(eldoc-mode +1)
	(tide-hl-identifier-mode +1)
	(company-mode +1)
    )
    ;; (add-hook 'before-save-hook 'tide-format-before-save)
    (add-hook 'typescript-mode-hook 'tide-ts-hook)
    (add-hook 'js-mode-hook 'tide-ts-hook)
)

(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

