return require("packer").startup(function(use)
  use {
    "wbthomason/packer.nvim",
    -- The following keys are all optional
    -- disable = boolean,           -- Mark a plugin as inactive
    -- as = string,                 -- Specifies an alias under which to install the plugin
    -- installer = function,        -- Specifies custom installer. See "custom installers" below.
    -- updater = function,          -- Specifies custom updater. See "custom installers" below.
    -- after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
    -- rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
    -- opt = boolean,               -- Manually marks a plugin as optional.
    -- bufread = boolean,           -- Manually specifying if a plugin needs BufRead after being loaded
    -- branch = string,             -- Specifies a git branch to use
    -- tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
    -- commit = string,             -- Specifies a git commit to use
    -- lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
    -- run = string|function|table  -- Post-update/install hook. See "update/install hooks".
    -- requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
    -- rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
    -- config = string or function, -- Specifies code to run after this plugin is loaded.
    -- -- The setup key implies opt = true
    -- setup = string or function,  -- Specifies code to run before this plugin is loaded. The code is ran even if
    --                              -- the plugin is waiting for other conditions (ft, cond...) to be met.
    --
    -- -- The following keys all imply lazy-loading and imply opt = true
    -- cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
    -- ft = string or list,         -- Specifies filetypes which load this plugin.
    -- keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
    -- event = string or list,      -- Specifies autocommand events which load this plugin.
    -- fn = string or list          -- Specifies functions which load this plugin.
    -- cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
    -- module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
    --                              -- with one of these module names, the plugin will be loaded.
    -- module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
    --                              -- requiring a string which matches one of these patterns, the plugin will be loaded
  }

  use {
    "joshdick/onedark.vim",
    setup = function()
      vim.g.onedark_terminal_italics = 1
    end,
    config = function()
      vim.cmd("colorscheme onedark")
      vim.cmd("hi NormalFloat guibg=#282c34")
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = {
      {"nvim-lua/plenary.nvim"}
    },
    config = function()
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
      vim.keymap.set("n", "<leader>fp", "<cmd>Telescope git_files<cr>")
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {},
        sync_install = false,
        auto_install = false,
        ignore_install = {},

        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false
        }
      }
    end
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.g.neo_tree_remove_legacy_commands = 1

      require("neo-tree").setup({
        close_if_last_window = false,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = false,
        sort_function = nil,
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- this sorts files and directories descendantly
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is
                                  -- enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            -- The next two settings are only a fallback, if you use
            -- nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if
                              -- you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if
                              -- you use git_status_colors on the name
              deleted   = "✖",
              renamed   = "",
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
        window = {
          position = "left",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<space>"] = { 
                "toggle_node", 
                nowait = false,
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            -- ["<esc>"] = "revert_preview",
            -- ["P"] = { "toggle_preview", config = { use_float = true } },
            ["\\"] = "open_split",
            ["|"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            -- ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            -- ["w"] = "open_with_window_picker",
            -- ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["a"] = { 
              "add",
              config = {
                show_path = "none" -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move",
            -- ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          }
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
            hide_by_name = {
              --"node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
              --"*.meta",
              --"*/src/*/tsconfig.json",
            },
            always_show = {
              --".gitignored",
            },
            never_show = {
              --".DS_Store",
              --"thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
              --".null-ls_*",
            },
          },
          follow_current_file = false, -- This will find and focus the
                                       -- file in the active buffer
                                       -- every time the current file
                                       -- is changed while the tree is
                                       -- open.
          group_empty_dirs = false, -- when true, empty folders will be
                                    -- grouped together
          hijack_netrw_behavior = "open_default",
          use_libuv_file_watcher = false,
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              -- ["D"] = "fuzzy_finder_directory",
              -- ["f"] = "filter_on_submit",
              -- ["<c-x>"] = "clear_filter",
              -- ["[g"] = "prev_git_modified",
              -- ["]g"] = "next_git_modified",
            }
          }
        },
        buffers = {
          follow_current_file = true,
          group_empty_dirs = true,
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            }
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              -- ["A"]  = "git_add_all",
              -- ["gu"] = "git_unstage_file",
              -- ["ga"] = "git_add_file",
              -- ["gr"] = "git_revert_file",
              -- ["gc"] = "git_commit",
              -- ["gp"] = "git_push",
              -- ["gg"] = "git_commit_and_push",
            }
          }
        }
      })
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")
    end -- config = function()
  } -- use neotree
  
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }

  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }

  use {
    "lewis6991/impatient.nvim"
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine = require "lualine"
      lualine.setup {
        options = {
          theme = "onedark"
        }
      }
    end
  }

  use {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  }

  use {
    "Darazaki/indent-o-matic",
    config = function()
      require("indent-o-matic").setup {
        max_lines = 8192,
        standard_widths = {2, 4, 8},
        skip_multiline = true
      }
    end
  }

  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          hover = {
            enabled = false,
            delay = 200,
            reveal = {"close"}
          },
          numbers = function(opts)
            return opts.raise(opts.id)
          end,
          diagnostics = "nvim_lsp"
        }
      }
    end
  }

  use {
    "famiu/bufdelete.nvim"
  }

  use {
    "p00f/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true
        }
      }
    end
  }
  
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
      local Terminal = require("toggleterm.terminal").Terminal
      local lg = Terminal:new {
        cmd = "lazygit",
        direction = "float",
        close_on_exit = true,
        hidden = true
      }

      function _lazygit_toggle()
        lg:toggle()
      end

      vim.keymap.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<cr>",
        {noremap = true, silent = true})
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  }

  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("nvim-treesitter.configs").setup {
        context_commentstring = {
          enable = true,
          enable_autocmd = false
        }
      }
    end
  }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        mappings = {
          basic = true,
          extra = false
        },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      }
    end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup()
    end
  }

  use {
    "ray-x/lsp_signature.nvim"
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("lsp_signature").setup {
        hint_enable = false,
        handler_opts = {
          border = "rounded"
        }
      }
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        -- The Default Handler
        function (server_name)
          local on_attach = function(client, bufnr)
            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
          end
          require("lspconfig")[server_name].setup {
            on_attach = on_attach
          }
        end,

        -- Optional setups
        -- ["rust_analyzer"] = function()
          -- ...
        -- end
      }
    end
  }

  use {
    "neovim/nvim-lspconfig"
  }

  use {
    "hrsh7th/cmp-buffer"
  }

  use {
    "hrsh7th/cmp-path"
  }

  use {
    "hrsh7th/cmp-cmdline"
  }

  use {
    "hrsh7th/cmp-nvim-lsp"
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        window = {
          completion = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm{ select = false },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, {"i", "s"}),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end)
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" }
        }, {
          { name = "buffer" },
        })
      }

    cmp.setup.cmdline({"/"}, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" }
      })
    })
    end -- config = function
  }

  use {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup{}
      vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<cr>")
    end
  }
end)
