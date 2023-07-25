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
-- smart dots
s(
  { trig = "...", wordTrig = false, snippetType = "autosnippet" },
  { t("\\dots") }
),

-- low dots
s(
  { trig = "l..", wordTrig = false, snippetType = "autosnippet" },
  { t("\\ldots") }
),

-- centred dots
s(
  { trig = "c..", wordTrig = false, snippetType = "autosnippet" },
  { t("\\cdots") }
),
}
