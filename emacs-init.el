;;; emacs-init -- initialize my emacs
;;;
;;; Commentary:
;;; Code:

(require 'package)

(defun emacs-init--config ()
  "Configure."
  (when window-system
    (tool-bar-mode 0))
  (menu-bar-mode 0)
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq inhibit-startup-screen t)
  (delete-selection-mode t)
  (global-auto-revert-mode t)

  (put 'downcase-region 'disabled nil)
  (put 'upcase-region 'disabled nil)
  ;; Add line numbers everywhere.
  (global-display-line-numbers-mode)

  ;; Setup flyspell.
  (require 'flyspell)
  (setq flyspell-issue-message-flag nil)
  (add-to-list 'prog-mode-hook #'flyspell-prog-mode)
  (add-to-list 'text-mode-hook #'flyspell-mode)
  ;; OSX settings.
  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq ns-function-modifier 'control)
    (global-set-key  (kbd "<end>") #'move-end-of-line)
    (global-set-key  (kbd "<home>") #'move-beginning-of-line)
    (global-set-key  (kbd "<next>") #'forward-paragraph)
    (global-set-key  (kbd "<prior>") #'backward-paragraph)))

(defun emacs-init--use-package-bootstrap ()
  "Download use-package plugin from melpa."
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)))

(defun emacs-init--use-package ()
  "Use required packages."
  (require 'use-package)

  (use-package monokai-pro-theme
    :ensure t
    :config (load-theme 'monokai-pro t))
  (use-package cmake-mode :ensure t)
  (use-package json-mode :ensure t)
  (use-package magit :ensure t)
  (use-package markdown-mode :ensure t)
  (use-package typescript-mode :ensure t)
  (use-package yaml-mode :ensure t)
  (use-package ivy
    :ensure t
    :init (ivy-mode t))
  (use-package projectile
    :ensure t
    :init (projectile-global-mode)
    :config (setq projectile-completion-system 'ivy)
    :bind-keymap
    ("C-c p" . projectile-command-map))
  ;; (use-package flycheck
  ;;   :ensure t
  ;;   :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :bind ("M-?" . complete-symbol))
  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))
  (use-package lsp-mode
    :ensure t
    :config (setq lsp-enable-file-watchers nil)
    :hook (prog-mode . lsp))
  (use-package lsp-ui :ensure t)
  (use-package lsp-treemacs :ensure t))

(defun emacs-init--main ()
  "Main entrypoint."
  (emacs-init--config)
  (emacs-init--use-package-bootstrap)
  (emacs-init--use-package))

(emacs-init--main)

(provide 'emacs-init)
;;; emacs-init.el ends here
