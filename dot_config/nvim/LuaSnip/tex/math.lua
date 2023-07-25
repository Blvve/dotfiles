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

-- in-line math
s({trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>$<>$",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  )
),

-- equation
s({trig = "([^%a])nn", wordTrig = false, regTrig = true, snippetType="autosnippet"},
  fmta(
    [[
    <>
    \begin{align}
            <>
    \end{align}
    ]],
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  )
),

-- fraction
s({trig = "ff", snippetType="autosnippet"},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone} 
),

-- subscript
s({trig = "__", wordTrig = false, snippetType="autosnippet"},
  fmta(
    "_{<>}",
    {
      i(1),
    }
  )
),

-- superscript
s({trig = "tt", wordTrig = false, snippetType="autosnippet"},
  fmta(
    "^{<>}",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}
),

s({trig = "opp", snippetType="autosnippet"},
  fmta(
    "\\operatorname{<>}",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}
),




-- some relations
s({trig="<=", snippetType="autosnippet"},
  {
    t("\\leq"),
  },
  {condition = in_mathzone}
),

s({trig=">=", snippetType="autosnippet"},
  {
    t("\\geq"),
  },
  {condition = in_mathzone}
),

s({trig=":=", snippetType="autosnippet"},
  {
    t("\\coloneq"),
  },
  {condition = in_mathzone}
),

s({trig="ll", snippetType="autosnippet"},
  {
    t("\\ll"),
  },
  {condition = in_mathzone}
),

s({trig="gg", snippetType="autosnippet"},
  {
    t("\\gg"),
  },
  {condition = in_mathzone}
),




-- Some greek letters
s({trig=";a", snippetType="autosnippet"},
  {
    t("\\alpha"),
  },
  {condition = in_mathzone}
),

s({trig=";A", snippetType="autosnippet"},
  {
    t("\\Alpha"),
  },
  {condition = in_mathzone}
),

s({trig=";b", snippetType="autosnippet"},
  {
    t("\\beta"),
  },
  {condition = in_mathzone}
),

s({trig=";b", snippetType="autosnippet"},
  {
    t("\\Beta"),
  },
  {condition = in_mathzone}
),

s({trig=";g", snippetType="autosnippet"},
  {
    t("\\gamma"),
  },
  {condition = in_mathzone}
),

s({trig=";G", snippetType="autosnippet"},
  {
    t("\\Gamma"),
  },
  {condition = in_mathzone}
),

s({trig=";G", snippetType="autosnippet"},
  {
    t("\\Gamma"),
  },
  {condition = in_mathzone}
),

s({trig=";d", snippetType="autosnippet"},
  {
    t("\\delta"),
  },
  {condition = in_mathzone}
),

s({trig=";D", snippetType="autosnippet"},
  {
    t("\\Delta"),
  },
  {condition = in_mathzone}
),

s({trig=";e", snippetType="autosnippet"},
  {
    t("\\epsilon"),
  },
  {condition = in_mathzone}
),
}


