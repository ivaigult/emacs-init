# My emacs configuration file

## Usage

Execute these in the scratch buffer:
```
(require 'use-package)
(setq package-check-signature nil)
(use-package gnu-elpa-keyring-update :ensure t)
(setq package-check-signature t)
```

Drop this line in your `.emacs`:
```
(load-file "~/workspace/emacs-init/emacs-init.el")
```

## Dependencies

Since this set-up relies on [`lsp-mode`](https://emacs-lsp.github.io/), some
symbol servers should be installed first:

 * `clangd` for C/C++ code completion and code navigation.
 * `pylsp` for python code completion and code navigation.
