return {
  -- mason
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

        -- web stuff
        "css-lsp",
        "html-lsp",
        -- "deno",
        -- "prettierd",
        "tailwindcss-language-server",
        "vue-language-server",
      },
    },
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- disable lsp watcher. Too slow on linux
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    opts = {
      inlay_hints = { enabled = true },
      format = {
        formatting_options = nil,
        timeout_ms = 5000,
      },
      servers = {
        html = {},
        cssls = {},
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
      },
      setup = {
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- null-ls
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     vim.list_extend(opts.sources, {
  --       -- lua
  --       nls.builtins.formatting.stylua,
  --
  --       -- golang
  --       nls.builtins.code_actions.gomodifytags,
  --       nls.builtins.code_actions.impl,
  --       -- nls.builtins.diagnostics.golangci_lint,
  --       -- nls.builtins.diagnostics.gospel,
  --       -- 提示给变量和方法添加注释
  --       -- nls.builtins.diagnostics.revive,
  --       -- nls.builtins.diagnostics.staticcheck,
  --       nls.builtins.formatting.gofmt,
  --       nls.builtins.formatting.gofumpt,
  --       nls.builtins.formatting.goimports,
  --       nls.builtins.formatting.goimports_reviser,
  --       -- nls.builtins.formatting.golines,
  --
  --       -- python
  --       nls.builtins.formatting.autopep8,
  --       nls.builtins.diagnostics.flake8,
  --       -- nls.builtins.diagnostics.pylint,
  --
  --       -- jsvascript
  --       -- nls.builtins.formatting.prettierd.with({ filetypes = { "html", "markdown", "css" } }),
  --       nls.builtins.code_actions.eslint_d,
  --       -- nls.builtins.formatting.prettier_eslint,
  --       nls.builtins.diagnostics.eslint_d,
  --       nls.builtins.formatting.eslint_d,
  --     })
  --   end,
  -- },
  --
  { -- null-ls
    "nvimtools/none-ls.nvim",
    dependencies = {
      "ThePrimeagen/refactoring.nvim",
    },
    opts = function(_, opts)
      local nls = require("null-ls")

      vim.list_extend(opts.sources, {
        -- git
        -- nls.builtins.diagnostics.commitlint,
        -- nls.builtins.code_actions.gitrebase,

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

        -- jsvascript
        -- nls.builtins.formatting.prettierd.with({ filetypes = { "html", "markdown", "css" } }),
        -- nls.builtins.code_actions.eslint_d,
        -- nls.builtins.formatting.prettier_eslint,
        -- nls.builtins.diagnostics.eslint_d,
        -- nls.builtins.formatting.eslint_d,

        -- misc
        nls.builtins.code_actions.refactoring,
      })
      return opts
    end,
  },
}
