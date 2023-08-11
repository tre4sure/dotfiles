return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        -- go stuff
        "gopls",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "staticcheck",
        "revive",
        "json-to-struct",
        "impl",
        "iferr",
        "gospel",
        "golines",
        "golangci-lint-langserver",
        "golangci-lint",
        "goimports-reviser",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "gopls",
        "json-lsp",

        -- python stuff
        "autopep8",
        "flake8",
        "pylint",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "lua",
        -- "vim", -- vim should always be installed but not in mine
        -- "vimdoc",
        "query",
        -- go stuff
        "go",
        "gomod",
        "gowork",
        "gosum",

        "python",
        "json",
        "jsonc",
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },

    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              semanticTokens = true,
            },
          },
        },
      },
      setup = {
        gopls = function()
          -- workaround for gopls not supporting semantictokensprovider
          -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "gopls" then
              if not client.server_capabilities.semanticTokensProvider then
                local semantic = client.config.capabilities.textDocument.semanticTokens
                client.server_capabilities.semanticTokensProvider = {
                  full = true,
                  legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                  },
                  range = true,
                }
              end
            end
          end)
          -- end workaround
        end,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        -- lua
        nls.builtins.formatting.stylua,

        -- golang
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        -- nls.builtins.diagnostics.golangci_lint,
        -- nls.builtins.diagnostics.gospel,
        -- 提示给变量和方法添加注释
        -- nls.builtins.diagnostics.revive,
        -- nls.builtins.diagnostics.staticcheck,
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.gofumpt,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.goimports_reviser,
        -- nls.builtins.formatting.golines,

        -- python
        nls.builtins.formatting.autopep8,
        nls.builtins.diagnostics.flake8,
        -- nls.builtins.diagnostics.pylint,
      })
    end,
  },
}
