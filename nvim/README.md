# Neovim Configuration

Neovim 0.11+ config using lazy.nvim. Leader key is `Space`.

## Core Features

- System clipboard integration
- Persistent undo across sessions
- 2-space indentation, no tabs
- Format-on-save (via conform.nvim with LSP fallback)
- Auto-installs LSP servers: `pyright`, `lua_ls`, `gopls`, `rust_analyzer`

## Cheat Sheet

### General

| Key | Description |
|-----|-------------|
| `jk` | Exit insert mode |
| `<Esc>` | Clear search highlights |
| `Y` | Yank to end of line |
| `<C-h/j/k/l>` | Navigate windows (also works across tmux panes) |
| `Shift-L` / `Shift-H` | Next / previous buffer |
| `<leader>d` | Close buffer |
| `<` / `>` (visual) | Indent and stay in visual mode |
| `Alt-j` / `Alt-k` (visual) | Move selected lines up/down |
| `<leader>?` | Show all keybindings (which-key) |

### File Explorer (oil.nvim)

Edit your filesystem like a normal buffer. Rename files by editing text, delete lines to delete files, paste to copy.

| Key | Description |
|-----|-------------|
| `<leader>e` or `-` | Open file explorer |
| `<CR>` | Open file/directory |
| `-` | Go to parent directory |
| `<C-v>` / `<C-s>` | Open in vertical/horizontal split |
| `g.` | Toggle hidden files |
| `g?` | Show all Oil keybindings |

### Find (Telescope)

| Key | Description |
|-----|-------------|
| `<leader>ff` | Find files |
| `<leader>fs` | Live grep (search text) |
| `<leader>fc` | Grep word under cursor |
| `<leader>fr` | Recent files |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `<leader>ft` | Find TODOs |
| `<C-j>` / `<C-k>` | Navigate results (inside picker) |
| `<C-q>` | Send results to quickfix list |

### LSP

| Key | Description |
|-----|-------------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `go` | Go to type definition |
| `gr` | Find references |
| `gs` | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>mp` | Format file (also works on visual selection) |

### Git (gitsigns.nvim + Telescope)

| Key | Description |
|-----|-------------|
| `]h` / `[h` | Next / previous hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` / `<leader>hR` | Stage / reset entire buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hb` | Blame current line |
| `<leader>hB` | Toggle inline blame |
| `<leader>hd` | Diff against index |
| `<leader>gc` | Browse git commits (Telescope) |
| `<leader>gb` | Browse git branches (Telescope) |
| `<leader>gs` | Git status (Telescope) |

### Diagnostics (Trouble)

| Key | Description |
|-----|-------------|
| `<leader>xx` | Toggle workspace diagnostics |
| `<leader>xd` | Toggle buffer diagnostics |
| `<leader>xs` | Toggle symbols |
| `<leader>xq` | Toggle quickfix list |
| `<leader>xt` | Toggle TODOs |

### Surround (mini.surround)

| Key | Description |
|-----|-------------|
| `sa{motion}{char}` | Add surrounding (e.g. `saiw"` to surround word with quotes) |
| `sd{char}` | Delete surrounding (e.g. `sd"` to remove quotes) |
| `sr{old}{new}` | Replace surrounding (e.g. `sr"'` to change `"` to `'`) |

### Completion (blink.cmp)

| Key | Description |
|-----|-------------|
| `<C-Space>` | Trigger completion / toggle docs |
| `<C-j>` / `<C-k>` | Navigate completion list |
| `<CR>` | Accept completion |
| `<C-e>` | Dismiss completion |

### Comments

| Key | Description |
|-----|-------------|
| `<C-/>` | Toggle comment (normal and visual mode) |
| `gcc` | Toggle line comment (built-in Comment.nvim) |
| `gbc` | Toggle block comment (built-in Comment.nvim) |

### Treesitter

| Key | Description |
|-----|-------------|
| `<C-Space>` | Start/expand incremental selection |
| `<BS>` | Shrink incremental selection |

## Plugins

| Plugin | Purpose |
|--------|---------|
| **lazy.nvim** | Plugin manager |
| **kanagawa.nvim** | Colorscheme (kanagawa-wave) |
| **nvim-lspconfig** + **mason.nvim** | LSP configuration and server auto-installation |
| **lazydev.nvim** | Neovim Lua API completions for lua_ls |
| **blink.cmp** | Fast completion engine with built-in snippet support |
| **conform.nvim** | Formatter with format-on-save (prettier, stylua, black, goimports) |
| **telescope.nvim** | Fuzzy finder for files, grep, git, and more |
| **nvim-treesitter** | Syntax highlighting, indentation, incremental selection |
| **nvim-ts-autotag** | Auto-close and rename HTML/JSX tags |
| **oil.nvim** | File explorer as an editable buffer |
| **trouble.nvim** | Pretty diagnostics, quickfix, and TODO list |
| **todo-comments.nvim** | Highlight and search TODO/FIXME/HACK comments |
| **gitsigns.nvim** | Git hunk signs, staging, blame, and diff |
| **Comment.nvim** | Toggle comments with context-aware language support |
| **nvim-autopairs** | Auto-close brackets, quotes, and tags |
| **mini.surround** | Add, delete, and replace surrounding pairs |
| **which-key.nvim** | Keybinding popup hints |
| **indent-blankline.nvim** | Indentation guides |
| **lualine.nvim** | Statusline |
| **vim-tmux-navigator** | Seamless navigation between Neovim and tmux panes |

## First Launch

```sh
nvim
```

On first launch, lazy.nvim will auto-install all plugins. Then:
- `:Lazy sync` to ensure everything is up to date
- Mason will auto-install LSP servers (pyright, lua_ls, gopls, rust_analyzer)
- Treesitter will auto-download parsers

Install formatters separately if needed:
```sh
npm i -g prettier
cargo install stylua
pip install black isort
go install golang.org/x/tools/cmd/goimports@latest
```
