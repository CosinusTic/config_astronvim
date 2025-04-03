-- ------------------------------------
-- File for externally downloaded configs
-- ------------------------------------

return {
    -- color theme
  {
    'comfysage/evergarden',
    priority = 1000,
    opts = {
      theme = {
        variant = 'fall',
        accent = 'green',
      },
      editor = {
        transparent_background = false,
        sign = { color = 'none' },
        float = {
          color = 'mantle',
          invert_border = false,
        },
        completion = {
          color = 'surface0',
        },
      },
    },
  },
  -- Language server protocol (LSP) activation for C & Rust
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup {}
      lspconfig.rust_analyzer.setup {}
    end
  },
  -- Autocompletion engine (manual trigger only)
{
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      completion = {
        autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged }, -- enable auto popup
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping.complete(), -- manual trigger
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          return vim_item
        end,
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      experimental = {
        ghost_text = true, -- optional inline ghost text preview
      },
      window = {
        completion = {
          max_height = 10, -- just in case
        },
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }),
      preselect = cmp.PreselectMode.None,
    })

    -- Limit number of suggestions shown (3)
    vim.opt.pumheight = 3
  end,
},

  -- Completion source for LSP
  { "hrsh7th/cmp-nvim-lsp" },

  -- Snippet engine (needed by cmp, but won't do anything unless configured)
  { "L3MON4D3/LuaSnip" },

  -- Completion for pairs: [[ , ", ', [, {, ( ]]
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
