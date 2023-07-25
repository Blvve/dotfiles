-- I just cannot, for the love of God, get this shit to work!!!!
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ltex" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
  on_attach = on_attach
}

local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
	table.insert(words, word)
end

require("lspconfig").ltex.setup {
  on_attach = on_attach,
  settings = {
    ltex = {
      dictionary = {
        en = words,
      }
    }
  }
}



-- require("lspconfig").ltex.setup {
--   on_attach = function(client, bufnr)
--         on_attach(client, bufnr)
--         require("ltex_extra").setup {
--     		load_langs = {'en-GB'},
--     		-- string : relative or absolute path to store dictionaries
--     		-- e.g. subfolder in the project root or the current working directory: ".ltex"
--     		-- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
--     		path = "", -- project root or current working directory
--     		-- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
--     		log_level = "none",
--         }
--     end
-- }


-- require("lspconfig").texlab.setup {
--   on_attach = on_attach
-- }
