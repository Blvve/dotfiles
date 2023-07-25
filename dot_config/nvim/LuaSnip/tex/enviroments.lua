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
s({trig="beg", snippetType="autosnippet"},
  fmta(
    [[
    \begin{<>}
            <>
    \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1), 
    }
  ),
  {condition = line_begin}
),

s({trig="thm", snippetType="autosnippet"},
  fmta(
    [[
    \begin{theorem}{<>}{<>}
            <>
    \end{theorem}
    ]],
    {
      i(1),
      i(2),
      i(3),
    }
  ),
  {condition = line_begin}
),

s({trig="cor", snippetType="autosnippet"},
  fmta(
    [[
    \begin{corollary}{<>}{<>}
            <>
    \end{corollary}
    ]],
    {
      i(1),
      i(2),
      i(3),
    }
  ),
  {condition = line_begin}
),

s({trig="lm", snippetType="autosnippet"},
  fmta(
    [[
    \begin{lemma}{<>}{<>}
            <>
    \end{lemma}
    ]],
    {
      i(1),
      i(2),
      i(3),
    }
  ),
  {condition = line_begin}
),

s({trig="prop", snippetType="autosnippet"},
  fmta(
    [[
    \begin{proposition}{<>}{<>}
            <>
    \end{proposition}
    ]],
    {
      i(1),
      i(2),
      i(3),
    }
  ),
  {condition = line_begin}
),

s({trig="def", snippetType="autosnippet"},
  fmta(
    [[
    \begin{definition}{<>}{<>}
            <>
    \end{definition}
    ]],
    {
      i(1),
      i(2),
      i(3),
    }
  ),
  {condition = line_begin}
),

s({trig="rmk", snippetType="autosnippet"},
  fmta(
    [[
    \begin{remark}{<>}{<>}
            <>
    \end{remark}
    ]],
    {
      i(1),
      i(2),
      i(3),
    }
  ),
  {condition = line_begin}
),

s({trig="conj", snippetType="autosnippet"},
  fmta(
    [[
    \begin{conjecture}{<>}{<>}
            <>
    \end{conjecture}
    ]],
    {
      i(1),
      i(2),
      i(3),
    }
  ),
  {condition = line_begin}
),

s({trig="hyp", snippetType="autosnippet"},
  fmta(
    [[
    \begin{hypothesis}{<>}{<>}
            <>
    \end{hypothesis}
    ]],
    {
      i(1),
      i(2),
      i(3),
    }
  ),
  {condition = line_begin}
),

s({trig="al"},
  fmta(
    [[
    \begin{align}
            <>
    \end{align}
    ]],
    {
      i(1),
    }
  ),
  {condition = line_begin}
),

-- enumerate with roman numerals
s({trig="ii"},
  fmta(
    [[
    \begin{enumerate}[label=(\roman*)]
            \item <>
    \end{enumerate}
    ]],
    {
      i(1),
    }
  ),
  {condition = line_begin}
),


}
