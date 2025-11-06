-- require("mason").setup({
--   ui = {
--       icons = {
--           package_installed = "✓",
--           package_pending = "➜",
--           package_uninstalled = "✗"
--       }
--   }
-- })
--
-- require("mason-lspconfig").setup({
--   -- 确保安装，根据需要填写
--   ensure_installed = {
--     "lua_ls",
--     "tinymist",
--   },
-- })
--
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- vim.lsp.config.lua_ls.setup {
--   capabilities = capabilities,
-- }
--
-- vim.lsp.config["tinymist"].setup {
--     offset_encoding = "utf-8",
--     settings = {
--         formatterMode = "typstyle",
--         exportPdf = "onSave",
--         semanticTokens = "disable",
--     }
-- }
--

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tinymist",
  },
})

-- optional, if you use nvim-cmp
local capabilities_ok, cmp_caps = pcall(require, 'cmp_nvim_lsp')
local capabilities = capabilities_ok and cmp_caps.default_capabilities() or nil

-- lua_ls
vim.lsp.config.lua_ls = vim.tbl_deep_extend('force', vim.lsp.config.lua_ls or {}, {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
})

-- tinymist
vim.lsp.config.tinymist = vim.tbl_deep_extend('force', vim.lsp.config.tinymist or {}, {
  offset_encoding = "utf-8",
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onSave",
    semanticTokens = "disable",
  },
})
