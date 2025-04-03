# Minimal Productive Neovim Config (C & Rust Dev)

A lightweight, plugin-based Neovim configuration optimized for **C** and **Rust** development.  
Manual suggestions, native LSP support, syntax-aware formatting, and cozy visuals.

---

## Features

-  Colorscheme: [evergarden](https://github.com/comfysage/evergarden)
-  LSP support for C (`clangd`) and Rust (`rust-analyzer`)
-  Manual completion with `<C-Space>`
-  Auto-pairing: `"`, `'`, `{`, `(`, etc.
-  File tree toggle with `<Space>e` (native `netrw`)
-  Syntax-aware formatting on save using `.clang-format`
-  Diagnostics with inline errors, signs, and underlines

---

## Requirements

Make sure the following tools are installed:

###  System Tools

| Tool            | Description                     | Install Command (Arch)                   |
|---------------  |---------------------------------|------------------------------------------|
| `neovim`        | The editor itself               | `sudo pacman -S neovim`                  |
| `gcc`           | C compiler                      | `sudo pacman -S gcc`                     |
| `clangd`        | C/C++ LSP backend               | `sudo pacman -S clang`                   |
| `rustup`        | Rust toolchain manager          | `sudo pacman -S rustup`                  |
| `rust-analyzer` | Rust LSP backend                | `rustup component add rust-analyzer`     |
| `git`           | Plugin fetching (lazy.nvim)     | `sudo pacman -S git`                     |

---

## Folder Structure
├── init.lua
├── lazy
│   └── lazy.nvim
│       ├── bootstrap.lua
│       ├── CHANGELOG.md
│       ├── doc
│       ├── LICENSE
│       ├── lua
│       ├── manifest
│       ├── README.md
│       ├── scripts
│       ├── selene.toml
│       ├── stylua.toml
│       ├── tests
│       ├── TODO.md
│       └── vim.toml
├── lazy-lock.json
├── lua
│   ├── colors.lua
│   ├── formatting.lua
│   ├── native.lua
│   └── plugins.lua
└── README.md

Every modification you bring is advised to be in ```/lua``` (```/lazy``` is more of an installer used for the
color theme here)


---


## Installation
------------
1. Clone this config:
   ```bash
   git clone https://github.com/yourusername/your-nvim-config ~/.config/nvim
   ```
2. Launch Neovim:
   nvim

3. Wait for lazy.nvim to install all plugins, or run manually:
   :Lazy sync

## Keybindings
-----------
- <Space>e         -> Toggle file explorer (netrw)
- <C-Space>        -> Manually trigger suggestions
- <C-n> / <C-p>    -> Navigate suggestions
- <CR>             -> Confirm suggestion
- <leader>s        -> Toggle syntax highlighting

## Formatting on Save
------------------
For C/C++ files, a local .clang-format file will be used to format code on :w.

## Optional Improvements
---------------------
- mason.nvim for LSP installer/manager
- nvim-dap for Rust or C debugging
- telescope.nvim for fuzzy file/project navigation


## License
-------
MIT - Just do what you want
