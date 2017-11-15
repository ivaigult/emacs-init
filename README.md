# My emacs configuration file

## Usage

Drop this line in your `.emacs`:

```
(load-file "~/workspace/emacs-init/emacs-init.el")
```

## Dependencies

Since this set-up relies on [`lsp-mode`](https://emacs-lsp.github.io/), some
symbol servers should be installed first:

 * `clangd` for C/C++ code completion and code navigation.
 * `pylsp` for python code completion and code navigation.
