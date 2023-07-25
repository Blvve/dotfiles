require('lualine').setup {
  options = {
    incons_enabled = true,
    theme = 'newpaper-light',
  },
  sections = {
    lualine_a = {
      {
	'filename',
	path = 1,
      }
    }
  }
}
