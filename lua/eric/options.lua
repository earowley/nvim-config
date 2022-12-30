-- Leader key = Space
vim.g.mapleader = " "

-- Basic options
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.encoding = "UTF-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.colorcolumn = {72}
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.laststatus = 3

-- Keymaps
local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>lr", "<cmd>set rnu!<cr>")
vim.keymap.set("n", "<leader>ln", "<cmd>set nu!<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>Bdelete<cr>")
vim.keymap.set("n", "<leader>bw", "<cmd>Bwipeout<cr>")
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "\\", "<cmd>split<cr>")
vim.keymap.set("n", "|", "<cmd>vsplit<cr>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>")
vim.keymap.set("n", "<C-S-j>", "<cmd>res -1<cr>")
vim.keymap.set("n", "<C-S-k>", "<cmd>res +1<cr>")
vim.keymap.set("n", "<C-S-h>", "<cmd>vertical res -1<cr>")
vim.keymap.set("n", "<C-S-l>", "<cmd>vertical res +1<cr>")
vim.keymap.set("n", "L", "<cmd>bn<cr>")
vim.keymap.set("n", "H", "<cmd>bp<cr>")
vim.keymap.set({"n", "v"}, "ge", "$")
vim.keymap.set({"n", "v"}, "gs", "0")
vim.keymap.set({"n", "v"}, "t", "f")
vim.keymap.set({"n", "v"}, "T", "F")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Unmaps
vim.keymap.set({"n", "v"}, "q", "<nop>")
vim.keymap.set({"n", "v"}, "Q", "<nop>")
vim.keymap.set({"n", "v"}, "r", "<nop>")
vim.keymap.set({"n", "v"}, "s", "<nop>")
vim.keymap.set({"n", "v"}, "0", "<nop>")
vim.keymap.set({"n", "v"}, "$", "<nop>")
vim.keymap.set({"n", "v"}, "f", "<nop>")
vim.keymap.set({"n", "v"}, "b", "<nop>")
vim.keymap.set({"n", "v"}, "B", "<nop>")
vim.keymap.set({"n", "v"}, "F", "<nop>")
vim.keymap.set({"n", "v"}, "S", "<nop>")
vim.keymap.set({"n", "v"}, "M", "<nop>")
vim.keymap.set({"v"}, "L", "<nop>")
vim.keymap.set({"v"}, "H", "<nop>")

-- Change diagnostic signs to use NerdFonts
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Remove virtual text
vim.diagnostic.config {
  virtual_text = false,
}
