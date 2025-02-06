return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
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

        -- web stuff
        "css-lsp",
        "html-lsp",
        -- "deno",
        -- "prettierd",
        "tailwindcss-language-server",
        "vue-language-server",
      })
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      },
      -- format = {
      --   formatting_options = nil,
      --   timeout_ms = 5000,
      -- },
      servers = {
        html = {},
        cssls = {},
        tailwindcss = {},
        tsserver = {
          -- root_dir = function(...)
          --   return require("lspconfig.util").root_pattern(".git")(...)
          -- end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        volar = {
          filetypes = {
            "vue",
            "javascript",
            "javascript.jsx",
            "typescript",
            "typescript.tsx",
            "javascriptreact",
            "typescriptreact",
            "json",
          },
        },
        marksman = {},
      },
      setup = {
        -- ["*"] = function(server, opts) end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["markdown"] = { { "prettierd", "prettier" }, "markdownlint" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        lua = { "selene", "luacheck" },
        markdown = { "markdownlint" },
      },
      linters = {
        selene = {
          condition = function(ctx)
            return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
          end,
        },
        luacheck = {
          condition = function(ctx)
            return vim.fs.find({ ".luacheckrc" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
