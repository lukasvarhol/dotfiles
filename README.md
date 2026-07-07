# Cross-platform dotfiles

Managing an Emacs config across multiple devices was becoming a pain, so this repo uses [chezmoi](https://www.chezmoi.io/) to keep everything in sync across Windows, Linux, and macOS. Cloning on a new machine and running `chezmoi apply` handles package installation, fonts, LSP servers, and editor configuration automatically.

## Setup

Make sure [chezmoi](https://www.chezmoi.io/install/) is installed and on your PATH, then run:

```bash
chezmoi init git@github.com:lukasvarhol/dotfiles.git
chezmoi apply
```

To pull and apply the latest changes:

```bash
chezmoi update
```

## Features

**Emacs**
- Language support via Eglot (LSP) and associated language servers: 
  - C/C++ 
  - CUDA
  - CMake
  - Go
  - Java
  - JavaScript
  - Nix
  - Powershell (no language server)
  - Python 
  - Rust
  - SystemVerilog
  - TCL
  - VHDL
- clangd configured with automatic `compile_commands.json` via a global CMake toolchain file
- Corfu inline completion
- Flyspell spell checking (en\_GB) for `.org` and `.md` files
- Theme: ef-spring
- Delete selection mode, global word-wrap, no backup files

## Platform Notes

**Windows**
- If Emacs has been opened on the machine before, delete `%APPDATA%\.emacs.d\` before running `chezmoi apply`. Emacs creates this directory on first launch, which prevents chezmoi from creating the required junction to `~\.emacs.d\`.
- The install script requires an elevated PowerShell window — chezmoi will prompt for this automatically.

**macOS**
- Hunspell dictionaries must be placed in `/Library/Spelling/`. The install script handles this automatically.
