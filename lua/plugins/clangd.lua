return {
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      config = {
        clangd = {
          capabilities = {
            offsetEncoding = "utf-8",
          },
        },
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim", -- install lsp plugin
    lazy = true,
    init = function()
      -- load clangd extensions when clangd attaches
      local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        desc = "Load clangd_extensions with clangd",
        callback = function(args)
          if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
            require "clangd_extensions"
            -- add more `clangd` setup here as needed such as loading autocmds
            vim.api.nvim_del_augroup_by_id(augroup) -- delete auto command since it only needs to happen once
          end
        end,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clangd" }, -- automatically install lsp
    },
  },
  lsp = {
    config = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
      },
    },
  },

  -- Formatting configuration
  -- You might need to install a formatter plugin if not already present
  plugins = {
    -- other plugins...
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        local null_ls = require "null-ls"
        config.sources = {
          -- other sources...
          null_ls.builtins.formatting.clang_format.with {
            extra_args = { "-style=file:~/.config/nvim/.clang-format" },
          },
        }
        return config
      end,
    },
  },
}
