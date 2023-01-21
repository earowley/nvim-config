## Installation

1. Install [packer.nvim](https://github.com/wbthomason/packer.nvim)

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Clone this repository

```bash
git clone https://github.com/earowley/nvim-config.git ~/.config/nvim
```

3. Run :PackerSync within Neovim

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
* nvim-lspconfig
* mason-lspconfig.nvim
* aerial.nvim
x null-ls.nvim
x mason-null-ls.nvim
* telescope.nvim
* gitsigns.nvim
* toggleterm.nvim
* nvim-autopairs
* nvim-ts-context-commentstring
* Comment.nvim
* indent-blankline.nvim
x which-key.nvim

## Management

* :PackerSync to update plugins
* :Mason to update and check status of debuggers/linters/lsp
* :LspInstall <server> to install a language server
* :TSInstall to install treesitter for a language
* :TSUpdate to ensure parsers are updated
* :TSInstallInfo to check installed parsers
