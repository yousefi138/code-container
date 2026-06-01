# Emacs 30.1 with R 4.5


## Rust

Added rust

```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

In emacs, install rust-mode (as described https://github.com/rust-lang/rust-mode):

```
M-x package-install rust-mode
```

And put the following in `dot-emacs` 

```
(require 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))
```

