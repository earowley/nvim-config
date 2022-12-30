## Installation

### 1. Install [packer.nvim](https://github.com/wbthomason/packer.nvim)

**Unix**

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

**Windows (PowerShell)**

```bash
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

### 2. Clone this repository

**Unix**

```bash
git clone https://github.com/earowley/nvim-config.git ~/.config/nvim
```

**Windows (PowerShell)**

```bash
git clone https://github.com/earowley/nvim-config.git "$env:LOCALAPPDATA\nvim"
```

### 3. Run :PackerSync within Neovim

### 4. (Optional) Uncomment require("impatient") in init.lua

## Plugins Used

* packer.nvim
* mason.nvim
* impatient.nvim
* plenary.nvim
* nvim-notify
* indent-o-matic
* vim-devicons
* bufferline.nvim
* bufdelete.nvim
* neo-tree.nvim
* lualine.nvim
* nvim-treesitter
* nvim-ts-rainbow
* nvim-cmp
* cmp-buffer
* cmp-cmdline
* cmp-path
* cmp-nvim-lsp
* lsp\_signature.nvim
* nvim-lspconfig
* mason-lspconfig.nvim
* aerial.nvim
* telescope.nvim
* gitsigns.nvim
* toggleterm.nvim
* nvim-autopairs
* nvim-ts-context-commentstring
* Comment.nvim
* indent-blankline.nvim

### (Todo)
* null-ls.nvim
* mason-null-ls.nvim
* which-key.nvim

## Management

* :PackerSync to update plugins
* :Mason to update and check status of debuggers/linters/lsp
* :LspInstall <server> to install a language server
* :TSInstall to install treesitter for a language
* :TSUpdate to ensure parsers are updated
* :TSInstallInfo to check installed parsers
