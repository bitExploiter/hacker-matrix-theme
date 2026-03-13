-- hacker-green.lua
-- Matrix/terminal-inspired green-on-black colorscheme for Neovim

vim.cmd "highlight clear"
if vim.fn.exists "syntax_on" then vim.cmd "syntax reset" end
vim.g.colors_name = "hacker-green"
vim.o.background = "dark"
vim.o.termguicolors = true

local c = {
  -- Backgrounds
  bg        = "#080e08",  -- near-black, subtle green tint
  bg_dark   = "#040804",  -- deeper black for floats/sidebar
  bg_alt    = "#0c170c",  -- slightly lifted for cursorline
  bg_visual = "#0f2a0f",  -- selection
  bg_search = "#1a4a00",  -- search match

  -- Foregrounds
  fg        = "#00ee3a",  -- main matrix green
  fg_bright = "#39ff14",  -- neon green for important items
  fg_dim    = "#00bb44",  -- operators / delimiters (was #009922, bumped for contrast)
  fg_muted  = "#1a8a2a",  -- line numbers, inactive (was #1a6a1a)

  -- Syntax palette
  green1    = "#00ff41",  -- keywords / statements   (neon, bold)
  green2    = "#33ff77",  -- functions               (bright, bold)
  green3    = "#00cc44",  -- unused, kept for compat
  green4    = "#00993a",  -- comments                (dim italic)
  green5    = "#ccffcc",  -- constants / booleans    (pale green)
  lime      = "#aaff00",  -- types / class names     (yellow-green)
  cyan      = "#00ffaa",  -- properties / CSS props  (cyan-green)
  mint      = "#7fffd4",  -- strings                 (aquamarine — clearly distinct)
  gold      = "#ffd700",  -- numbers                 (bright gold)
  amber     = "#ffaa00",  -- special chars / units   (orange-amber)
  orange    = "#ff9900",  -- warnings
  red       = "#ff3333",  -- errors
  red_dim   = "#661111",  -- error bg tint
  pink      = "#ff66aa",  -- removed / diff deleted

  -- UI chrome
  border    = "#1a4a1a",
  gutter    = "#0a1a0a",
  statusbar = "#0c1e0c",
  tabline   = "#060e06",
  popup_bg  = "#0a1a0a",
  scrollbar = "#1a3a1a",
  indent    = "#0f200f",
  matchbg   = "#0f3a0f",

  -- Git diff
  diff_add    = "#0a2a0a",
  diff_change = "#0a1a2a",
  diff_delete = "#2a0a0a",
  diff_text   = "#102a10",

  none      = "NONE",
}

---@param group string
---@param opts {fg?:string,bg?:string,sp?:string,bold?:boolean,italic?:boolean,underline?:boolean,undercurl?:boolean,strikethrough?:boolean,link?:string}
local function hi(group, opts)
  if opts.link then
    vim.api.nvim_set_hl(0, group, { link = opts.link })
    return
  end
  vim.api.nvim_set_hl(0, group, {
    fg            = opts.fg,
    bg            = opts.bg,
    sp            = opts.sp,
    bold          = opts.bold,
    italic        = opts.italic,
    underline     = opts.underline,
    undercurl     = opts.undercurl,
    strikethrough = opts.strikethrough,
  })
end

-- ── Editor ────────────────────────────────────────────────────────────────────
hi("Normal",        { fg = c.fg,       bg = c.bg })
hi("NormalFloat",   { fg = c.fg,       bg = c.popup_bg })
hi("NormalNC",      { fg = c.fg_dim,   bg = c.bg_dark })
hi("ColorColumn",   { bg = c.bg_alt })
hi("Conceal",       { fg = c.fg_muted })
hi("CursorColumn",  { bg = c.bg_alt })
hi("CursorLine",    { bg = c.bg_alt })
hi("CursorLineFold",{ fg = c.fg_muted, bg = c.bg_alt })
hi("CursorLineNr",  { fg = c.fg_bright, bg = c.bg_alt, bold = true })
hi("CursorLineSign",{ bg = c.bg_alt })
hi("LineNr",        { fg = c.fg_muted, bg = c.gutter })
hi("LineNrAbove",   { fg = c.fg_muted })
hi("LineNrBelow",   { fg = c.fg_muted })
hi("SignColumn",    { fg = c.fg_muted, bg = c.gutter })
hi("FoldColumn",    { fg = c.green4,   bg = c.gutter })
hi("Folded",        { fg = c.green4,   bg = c.bg_alt, italic = true })

hi("EndOfBuffer",   { fg = c.bg_dark })
hi("NonText",       { fg = c.fg_muted })
hi("SpecialKey",    { fg = c.fg_muted })
hi("Whitespace",    { fg = c.indent })

hi("Visual",        { bg = c.bg_visual })
hi("VisualNOS",     { bg = c.bg_visual })
hi("Search",        { fg = c.bg,     bg = c.green1, bold = true })
hi("CurSearch",     { fg = c.bg,     bg = c.fg_bright, bold = true })
hi("IncSearch",     { fg = c.bg,     bg = c.lime, bold = true })
hi("Substitute",    { fg = c.bg,     bg = c.amber })

hi("MatchParen",    { fg = c.fg_bright, bg = c.matchbg, bold = true })
hi("WildMenu",      { fg = c.bg,     bg = c.green1 })

hi("Pmenu",         { fg = c.fg,       bg = c.popup_bg })
hi("PmenuSel",      { fg = c.bg,       bg = c.green2, bold = true })
hi("PmenuSbar",     { bg = c.scrollbar })
hi("PmenuThumb",    { bg = c.green4 })
hi("PmenuKind",     { fg = c.lime,     bg = c.popup_bg })
hi("PmenuKindSel",  { fg = c.bg,       bg = c.green2 })
hi("PmenuExtra",    { fg = c.fg_dim,   bg = c.popup_bg })
hi("PmenuExtraSel", { fg = c.bg,       bg = c.green2 })

hi("FloatBorder",   { fg = c.border,   bg = c.popup_bg })
hi("FloatTitle",    { fg = c.fg_bright, bg = c.popup_bg, bold = true })
hi("FloatFooter",   { fg = c.fg_muted, bg = c.popup_bg })

hi("StatusLine",    { fg = c.fg,       bg = c.statusbar })
hi("StatusLineNC",  { fg = c.fg_muted, bg = c.statusbar })
hi("TabLine",       { fg = c.fg_dim,   bg = c.tabline })
hi("TabLineFill",   { bg = c.tabline })
hi("TabLineSel",    { fg = c.bg,       bg = c.green2, bold = true })

hi("WinBar",        { fg = c.fg_dim,   bg = c.bg })
hi("WinBarNC",      { fg = c.fg_muted, bg = c.bg_dark })
hi("WinSeparator",  { fg = c.border })

hi("MsgArea",       { fg = c.fg })
hi("MsgSeparator",  { fg = c.border })
hi("MoreMsg",       { fg = c.green1, bold = true })
hi("ModeMsg",       { fg = c.fg_bright, bold = true })
hi("Question",      { fg = c.green2 })
hi("ErrorMsg",      { fg = c.red })
hi("WarningMsg",    { fg = c.orange })

hi("Title",         { fg = c.fg_bright, bold = true })
hi("Directory",     { fg = c.green2 })

-- ── Diagnostics ───────────────────────────────────────────────────────────────
hi("DiagnosticError",           { fg = c.red })
hi("DiagnosticWarn",            { fg = c.orange })
hi("DiagnosticInfo",            { fg = c.cyan })
hi("DiagnosticHint",            { fg = c.green2 })
hi("DiagnosticOk",              { fg = c.green3 })
hi("DiagnosticUnderlineError",  { sp = c.red,    undercurl = true })
hi("DiagnosticUnderlineWarn",   { sp = c.orange, undercurl = true })
hi("DiagnosticUnderlineInfo",   { sp = c.cyan,   undercurl = true })
hi("DiagnosticUnderlineHint",   { sp = c.green2, undercurl = true })
hi("DiagnosticVirtualTextError",{ fg = c.red,    bg = c.red_dim, italic = true })
hi("DiagnosticVirtualTextWarn", { fg = c.orange, italic = true })
hi("DiagnosticVirtualTextInfo", { fg = c.cyan,   italic = true })
hi("DiagnosticVirtualTextHint", { fg = c.fg_dim, italic = true })
hi("DiagnosticSignError",       { fg = c.red })
hi("DiagnosticSignWarn",        { fg = c.orange })
hi("DiagnosticSignInfo",        { fg = c.cyan })
hi("DiagnosticSignHint",        { fg = c.green2 })

-- ── Syntax ────────────────────────────────────────────────────────────────────
hi("Comment",     { fg = c.green4, italic = true })
hi("Constant",    { fg = c.green5 })
hi("String",      { fg = c.mint })
hi("Character",   { fg = c.mint })
hi("Number",      { fg = c.gold })
hi("Float",       { fg = c.gold })
hi("Boolean",     { fg = c.green5, bold = true })

hi("Identifier",  { fg = c.fg })
hi("Function",    { fg = c.green2, bold = true })

hi("Statement",   { fg = c.green1, bold = true })
hi("Conditional", { fg = c.green1, bold = true })
hi("Repeat",      { fg = c.green1, bold = true })
hi("Label",       { fg = c.green1 })
hi("Operator",    { fg = c.fg_dim })
hi("Keyword",     { fg = c.green1, bold = true })
hi("Exception",   { fg = c.red })

hi("PreProc",     { fg = c.cyan })
hi("Include",     { fg = c.cyan })
hi("Define",      { fg = c.cyan })
hi("Macro",       { fg = c.cyan })
hi("PreCondit",   { fg = c.cyan })

hi("Type",        { fg = c.lime })
hi("StorageClass",{ fg = c.lime })
hi("Structure",   { fg = c.lime })
hi("Typedef",     { fg = c.lime })

hi("Special",     { fg = c.cyan })
hi("SpecialChar", { fg = c.amber })
hi("SpecialKey",  { fg = c.amber })
hi("Tag",         { fg = c.green2 })
hi("Delimiter",   { fg = c.fg_dim })
hi("SpecialComment",{ fg = c.green4, bold = true })
hi("Debug",       { fg = c.orange })

hi("Underlined",  { fg = c.cyan, underline = true })
hi("Ignore",      { fg = c.fg_muted })
hi("Error",       { fg = c.red, bold = true })
hi("Todo",        { fg = c.bg, bg = c.amber, bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@variable",             { fg = c.fg })
hi("@variable.builtin",     { fg = c.green5, italic = true })
hi("@variable.parameter",   { fg = c.fg })
hi("@variable.member",      { fg = c.cyan })

hi("@constant",             { fg = c.green5 })
hi("@constant.builtin",     { fg = c.green5, bold = true })
hi("@constant.macro",       { fg = c.cyan })

hi("@string",               { fg = c.mint })
hi("@string.escape",        { fg = c.amber,  bold = true })
hi("@string.special",       { fg = c.amber })
hi("@string.regexp",        { fg = c.amber,  italic = true })

hi("@number",               { fg = c.gold })
hi("@number.float",         { fg = c.gold })
hi("@boolean",              { fg = c.green5, bold = true })

hi("@function",             { fg = c.green2, bold = true })
hi("@function.builtin",     { fg = c.green2 })
hi("@function.call",        { fg = c.green2 })
hi("@function.macro",       { fg = c.cyan })
hi("@function.method",      { fg = c.green2, bold = true })
hi("@function.method.call", { fg = c.green2 })

hi("@constructor",          { fg = c.lime })
hi("@operator",             { fg = c.fg_dim })

hi("@keyword",              { fg = c.green1, bold = true })
hi("@keyword.function",     { fg = c.green1, bold = true })
hi("@keyword.operator",     { fg = c.green1 })
hi("@keyword.import",       { fg = c.cyan })
hi("@keyword.modifier",     { fg = c.green1 })
hi("@keyword.repeat",       { fg = c.green1, bold = true })
hi("@keyword.return",       { fg = c.green1, bold = true })
hi("@keyword.exception",    { fg = c.red })
hi("@keyword.conditional",  { fg = c.green1, bold = true })

hi("@type",                 { fg = c.lime })
hi("@type.builtin",         { fg = c.lime, italic = true })
hi("@type.definition",      { fg = c.lime })

hi("@attribute",            { fg = c.cyan })
hi("@property",             { fg = c.cyan })
hi("@tag",                  { fg = c.green1, bold = true })
hi("@tag.attribute",        { fg = c.lime })
hi("@tag.delimiter",        { fg = c.fg_dim })

hi("@comment",              { fg = c.green4, italic = true })
hi("@comment.documentation",{ fg = c.green4, bold = true })
hi("@comment.todo",         { fg = c.bg, bg = c.amber, bold = true })
hi("@comment.error",        { fg = c.red, bold = true })
hi("@comment.warning",      { fg = c.orange, bold = true })
hi("@comment.note",         { fg = c.cyan, bold = true })

hi("@markup.heading",       { fg = c.fg_bright, bold = true })
hi("@markup.heading.1",     { fg = c.green1, bold = true })
hi("@markup.heading.2",     { fg = c.green2, bold = true })
hi("@markup.heading.3",     { fg = c.green2, bold = true })
hi("@markup.raw",           { fg = c.mint })
hi("@markup.link",          { fg = c.cyan, underline = true })
hi("@markup.link.url",      { fg = c.cyan, underline = true })
hi("@markup.list",          { fg = c.green2 })
hi("@markup.italic",        { italic = true })
hi("@markup.bold",          { bold = true })
hi("@markup.strikethrough", { strikethrough = true })

hi("@punctuation.bracket",  { fg = c.fg_dim })
hi("@punctuation.delimiter",{ fg = c.fg_dim })
hi("@punctuation.special",  { fg = c.cyan })

hi("@module",               { fg = c.cyan })
hi("@namespace",            { link = "@module" })
hi("@label",                { fg = c.lime })

-- ── LSP Semantic Tokens ───────────────────────────────────────────────────────
hi("@lsp.type.class",       { link = "@type" })
hi("@lsp.type.enum",        { link = "@type" })
hi("@lsp.type.interface",   { link = "@type" })
hi("@lsp.type.struct",      { link = "@type" })
hi("@lsp.type.type",        { link = "@type" })
hi("@lsp.type.typeParameter",{link = "@type" })
hi("@lsp.type.namespace",   { link = "@module" })
hi("@lsp.type.variable",    { link = "@variable" })
hi("@lsp.type.parameter",   { link = "@variable.parameter" })
hi("@lsp.type.property",    { link = "@property" })
hi("@lsp.type.function",    { link = "@function" })
hi("@lsp.type.method",      { link = "@function.method" })
hi("@lsp.type.macro",       { link = "@function.macro" })
hi("@lsp.type.keyword",     { link = "@keyword" })
hi("@lsp.type.comment",     { link = "@comment" })
hi("@lsp.type.string",      { link = "@string" })
hi("@lsp.type.number",      { link = "@number" })
hi("@lsp.type.operator",    { link = "@operator" })
hi("@lsp.type.enumMember",  { link = "@constant" })
hi("@lsp.typemod.function.defaultLibrary", { fg = c.green2 })
hi("@lsp.typemod.variable.defaultLibrary", { fg = c.green5, italic = true })

-- ── Git / Diff ────────────────────────────────────────────────────────────────
hi("DiffAdd",     { bg = c.diff_add })
hi("DiffChange",  { bg = c.diff_change })
hi("DiffDelete",  { fg = c.red_dim, bg = c.diff_delete })
hi("DiffText",    { bg = c.diff_text })
hi("diffAdded",   { fg = c.green3 })
hi("diffRemoved", { fg = c.red })
hi("diffChanged", { fg = c.cyan })
hi("diffFile",    { fg = c.fg_bright, bold = true })
hi("diffLine",    { fg = c.amber })
hi("diffIndexLine",{ fg = c.cyan })

-- ── Git Signs / Gitsigns plugin ───────────────────────────────────────────────
hi("GitSignsAdd",    { fg = c.green3 })
hi("GitSignsChange", { fg = c.cyan })
hi("GitSignsDelete", { fg = c.red })

-- ── Spell ─────────────────────────────────────────────────────────────────────
hi("SpellBad",   { sp = c.red,    undercurl = true })
hi("SpellCap",   { sp = c.orange, undercurl = true })
hi("SpellRare",  { sp = c.cyan,   undercurl = true })
hi("SpellLocal", { sp = c.green2, undercurl = true })

-- ── Telescope / fzf-lua ───────────────────────────────────────────────────────
hi("TelescopeBorder",         { fg = c.border,   bg = c.popup_bg })
hi("TelescopeNormal",         { fg = c.fg,       bg = c.popup_bg })
hi("TelescopePromptNormal",   { fg = c.fg_bright,bg = c.bg_alt })
hi("TelescopePromptBorder",   { fg = c.green2,   bg = c.bg_alt })
hi("TelescopePromptTitle",    { fg = c.bg, bg = c.green2, bold = true })
hi("TelescopeResultsBorder",  { fg = c.border,   bg = c.popup_bg })
hi("TelescopeResultsTitle",   { fg = c.fg_muted, bg = c.popup_bg })
hi("TelescopePreviewBorder",  { fg = c.border,   bg = c.popup_bg })
hi("TelescopePreviewTitle",   { fg = c.fg_muted, bg = c.popup_bg })
hi("TelescopeSelection",      { fg = c.bg,       bg = c.green2 })
hi("TelescopeMatching",       { fg = c.fg_bright, bold = true })

-- ── nvim-tree / neo-tree ──────────────────────────────────────────────────────
hi("NvimTreeNormal",      { fg = c.fg,     bg = c.bg_dark })
hi("NvimTreeRootFolder",  { fg = c.green1, bold = true })
hi("NvimTreeFolderIcon",  { fg = c.green2 })
hi("NvimTreeFolderName",  { fg = c.green2 })
hi("NvimTreeOpenedFolderName", { fg = c.fg_bright, bold = true })
hi("NvimTreeFileName",    { fg = c.fg })
hi("NvimTreeExecFile",    { fg = c.lime,   bold = true })
hi("NvimTreeGitDirty",    { fg = c.orange })
hi("NvimTreeGitNew",      { fg = c.green3 })
hi("NvimTreeGitDeleted",  { fg = c.red })
hi("NvimTreeIndentMarker",{ fg = c.indent })

-- ── Lazy.nvim ─────────────────────────────────────────────────────────────────
hi("LazyNormal",   { fg = c.fg,     bg = c.popup_bg })
hi("LazyBorder",   { fg = c.border, bg = c.popup_bg })
hi("LazyButton",   { fg = c.fg,     bg = c.bg_alt })
hi("LazyButtonActive",{ fg = c.bg,  bg = c.green2, bold = true })
hi("LazyH1",       { fg = c.fg_bright, bold = true })
hi("LazySpecial",  { fg = c.green2 })

-- ── Mason ─────────────────────────────────────────────────────────────────────
hi("MasonNormal",  { fg = c.fg, bg = c.popup_bg })

-- ── Which-key ─────────────────────────────────────────────────────────────────
hi("WhichKey",          { fg = c.green1 })
hi("WhichKeyGroup",     { fg = c.lime })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.fg_muted })
hi("WhichKeyBorder",    { fg = c.border, bg = c.popup_bg })
hi("WhichKeyNormal",    { bg = c.popup_bg })
hi("WhichKeyTitle",     { fg = c.fg_bright, bold = true })

-- ── Indent-blankline ─────────────────────────────────────────────────────────
hi("IblIndent",       { fg = c.indent })
hi("IblScope",        { fg = c.green4 })
hi("IndentBlanklineChar",      { fg = c.indent })
hi("IndentBlanklineContextChar",{ fg = c.green4 })

-- ── nvim-cmp ──────────────────────────────────────────────────────────────────
hi("CmpItemAbbr",           { fg = c.fg })
hi("CmpItemAbbrDeprecated", { fg = c.fg_muted, strikethrough = true })
hi("CmpItemAbbrMatch",      { fg = c.fg_bright, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.green2 })
hi("CmpItemMenu",           { fg = c.fg_muted, italic = true })
hi("CmpItemKindDefault",    { fg = c.fg_dim })
hi("CmpItemKindFunction",   { fg = c.green2 })
hi("CmpItemKindMethod",     { fg = c.green2 })
hi("CmpItemKindConstructor",{ fg = c.lime })
hi("CmpItemKindClass",      { fg = c.lime })
hi("CmpItemKindInterface",  { fg = c.lime })
hi("CmpItemKindEnum",       { fg = c.lime })
hi("CmpItemKindStruct",     { fg = c.lime })
hi("CmpItemKindField",      { fg = c.fg })
hi("CmpItemKindProperty",   { fg = c.fg })
hi("CmpItemKindVariable",   { fg = c.fg })
hi("CmpItemKindKeyword",    { fg = c.green1 })
hi("CmpItemKindModule",     { fg = c.cyan })
hi("CmpItemKindSnippet",    { fg = c.amber })
hi("CmpItemKindText",       { fg = c.fg_dim })
hi("CmpItemKindValue",      { fg = c.amber })
hi("CmpItemKindUnit",       { fg = c.amber })
hi("CmpItemKindConstant",   { fg = c.green5 })
hi("CmpItemKindColor",      { fg = c.pink })
hi("CmpItemKindFile",       { fg = c.fg_dim })
hi("CmpItemKindFolder",     { fg = c.green2 })
hi("CmpItemKindReference",  { fg = c.cyan })
hi("CmpItemKindOperator",   { fg = c.fg_dim })
hi("CmpItemKindTypeParameter",{ fg = c.lime })
hi("CmpItemKindCopilot",    { fg = c.green2 })

-- ── Dashboard / snacks ────────────────────────────────────────────────────────
-- ── HTML / CSS ────────────────────────────────────────────────────────────────
-- CSS property names: cyan (clearly distinct from values)
hi("@property.css",              { fg = c.cyan })
-- CSS values: keywords like flex, center, solid, hidden
hi("@string.plain.css",          { fg = c.fg })
hi("@keyword.css",               { fg = c.green1 })
-- CSS selectors: .class, #id, element
hi("@type.css",                  { fg = c.lime,    bold = true })
hi("@string.special.css",        { fg = c.lime })
-- CSS units and numbers
hi("@string.css",                { fg = c.mint })
-- HTML tags: bright green, bold
hi("@tag.html",                  { fg = c.green1,  bold = true })
hi("@tag.builtin.html",          { fg = c.green1,  bold = true })
-- HTML attributes: lime (distinct from tag names)
hi("@tag.attribute.html",        { fg = c.lime })
-- HTML attribute values: strings
hi("@string.html",               { fg = c.green3 })
-- HTML delimiters < > / =
hi("@tag.delimiter.html",        { fg = c.fg_dim })

hi("SnacksDashboardNormal",  { fg = c.fg,       bg = c.bg })
hi("SnacksDashboardHeader",  { fg = c.green1 })
hi("SnacksDashboardTitle",   { fg = c.fg_bright, bold = true })
hi("SnacksDashboardDesc",    { fg = c.fg_dim })
hi("SnacksDashboardKey",     { fg = c.green1, bold = true })
hi("SnacksDashboardIcon",    { fg = c.green2 })
hi("SnacksDashboardSpecial", { fg = c.cyan })
hi("SnacksDashboardFooter",  { fg = c.green4, italic = true })
