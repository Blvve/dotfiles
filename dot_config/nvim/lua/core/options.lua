vim.opt.cursorline    = true   	  -- highlight current line
vim.opt.showcmd       = true	  -- shows partially typed commands
vim.opt.incsearch     = false     -- don't jump to search results as search string is being typed
vim.opt.foldmethod    = "marker"
vim.opt.autowrite     = true      -- write current buffer when moving buffers

vim.opt.wrap          = true      -- wrap long lines
vim.opt.linebreak     = true      -- break lines at words
vim.opt.breakindent   = true      -- wrapped lines visually preserve indentation

vim.opt.spelllang     = "en_gb"   -- set British English as default language for spell checking
vim.opt.spell         = true      -- set spell check on by default. I might change it to only turn on for .tex files though.

 -- h/t https://jeffkreeftmeijer.com/vim-number/
 -- auto toggle of hybrid line number
vim.opt.number        = true
vim.cmd [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter,CmdlineLeave * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave,CmdlineEnter   * if &nu                  | set nornu | redraw | endif
  augroup END
]] 
