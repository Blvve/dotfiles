local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Summary: When `SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else  -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-------------------------------------------------------------------

return {
-- emphasize text
s({trig = "([^%a])em", wordTrig = false, regTrig = true},
  fmta(
    "<>\\emph{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  )
),
}
