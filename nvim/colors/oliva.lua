-- =============================================================
-- Tema: oliva (paleta sepia/verde-oliva do i3wm + wallpaper verde)
--
-- Tema escuro com fundo verde-oliva, texto oliva claro e destaques
-- em tons de oliva/sepia. Casa com o kitty, alacritty, i3bar, rofi
-- e dunst.
--
--   #15190F fundo        #A4A479 texto
--   #2B3321 fundo-alt    #797B53 destaque/selecao
--   #C6C396 brilho       #12150D texto-sobre-destaque
--   #784421 accent-quente (erros/urgent)
-- =============================================================

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "oliva"

local c = {
  bg        = "#15190F",
  bg_alt    = "#2B3321",
  bg_popup  = "#1D2316",
  bg_status = "#2B3321",
  fg        = "#A4A479",
  fg_dim    = "#939470",
  comment   = "#6D7053",
  gutter    = "#5E6750",
  border    = "#797B53",
  hl        = "#3D472C",
  accent1   = "#C6C396", -- strings/constantes (brilho)
  accent2   = "#9F9F78", -- keywords/types
  accent3   = "#797B53", -- funcoes
  warm      = "#784421", -- erros/replace
  warn      = "#A0723B", -- warnings
  info      = "#939470", -- info
  hint      = "#BFBD91", -- hints
  sel_bg    = "#797B53",
  sel_fg    = "#12150D",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Base
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg_popup })
hl("FloatBorder", { fg = c.border, bg = c.bg_popup })
hl("FloatTitle", { fg = c.accent2, bg = c.bg_popup, bold = true })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorLine", { bg = c.bg_alt })
hl("CursorColumn", { bg = c.bg_alt })
hl("CursorLineNr", { fg = c.fg, bold = true })
hl("LineNr", { fg = c.gutter })
hl("SignColumn", { bg = c.bg })
hl("ColorColumn", { bg = c.bg_alt })
hl("VertSplit", { fg = c.border, bg = c.bg })
hl("WinSeparator", { fg = c.border, bg = c.bg })
hl("StatusLine", { fg = c.fg, bg = c.bg_status })
hl("StatusLineNC", { fg = c.fg_dim, bg = c.bg_status })
hl("TabLine", { fg = c.fg_dim, bg = c.bg_alt })
hl("TabLineSel", { fg = c.fg, bg = c.bg })
hl("TabLineFill", { bg = c.bg })
hl("Pmenu", { fg = c.fg, bg = c.bg_popup })
hl("PmenuSel", { fg = c.sel_fg, bg = c.sel_bg })
hl("PmenuSbar", { bg = c.bg_alt })
hl("PmenuThumb", { bg = c.gutter })
hl("Visual", { fg = c.sel_fg, bg = c.sel_bg })
hl("VisualNOS", { fg = c.sel_fg, bg = c.sel_bg })
hl("Search", { fg = c.sel_fg, bg = c.accent3 })
hl("IncSearch", { fg = c.sel_fg, bg = c.accent1, bold = true })
hl("CurSearch", { fg = c.sel_fg, bg = c.accent1, bold = true })
hl("Substitute", { fg = c.sel_fg, bg = c.accent1, bold = true })
hl("MatchParen", { fg = c.accent1, bg = c.hl, bold = true })
hl("Folded", { fg = c.comment, bg = c.bg_alt })
hl("FoldColumn", { fg = c.gutter })
hl("NonText", { fg = c.gutter })
hl("SpecialKey", { fg = c.accent2 })
hl("EndOfBuffer", { fg = c.bg })
hl("Whitespace", { fg = c.gutter })
hl("Directory", { fg = c.accent3 })
hl("Title", { fg = c.accent2, bold = true })
hl("Question", { fg = c.warn })
hl("MoreMsg", { fg = c.accent1, bold = true })
hl("ModeMsg", { fg = c.fg, bold = true })
hl("MsgArea", { fg = c.fg_dim })
hl("ErrorMsg", { fg = c.warm })
hl("WarningMsg", { fg = c.warn })

-- Diagnostics / spelling
hl("Error", { fg = c.warm })
hl("Exception", { fg = c.warm })
hl("DiagnosticError", { fg = c.warm })
hl("DiagnosticWarn", { fg = c.warn })
hl("DiagnosticInfo", { fg = c.info })
hl("DiagnosticHint", { fg = c.hint })
hl("DiagnosticVirtualTextError", { fg = c.warm })
hl("DiagnosticVirtualTextWarn", { fg = c.warn })
hl("DiagnosticVirtualTextInfo", { fg = c.info })
hl("DiagnosticVirtualTextHint", { fg = c.hint })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.warm })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.warn })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c.info })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = c.hint })
hl("SpellBad", { undercurl = true, sp = c.warm })
hl("SpellCap", { undercurl = true, sp = c.warn })
hl("SpellLocal", { undercurl = true, sp = c.info })
hl("SpellRare", { undercurl = true, sp = c.hint })

-- Diff
hl("DiffAdd", { fg = c.accent1, bg = c.bg })
hl("DiffChange", { fg = c.accent3, bg = c.bg })
hl("DiffDelete", { fg = c.warm, bg = c.bg })
hl("DiffText", { fg = c.fg, bg = c.bg_alt })

-- Syntax classico
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.accent1 })
hl("String", { fg = c.accent1, italic = true })
hl("Character", { fg = c.accent1 })
hl("Number", { fg = c.accent1 })
hl("Boolean", { fg = c.accent1 })
hl("Float", { fg = c.accent1 })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.accent3 })
hl("Statement", { fg = c.accent2 })
hl("Conditional", { fg = c.accent2 })
hl("Repeat", { fg = c.accent2 })
hl("Label", { fg = c.accent2 })
hl("Operator", { fg = c.fg })
hl("Keyword", { fg = c.accent2, bold = true })
hl("Include", { fg = c.accent2 })
hl("Define", { fg = c.accent2 })
hl("Macro", { fg = c.accent2 })
hl("PreProc", { fg = c.accent2 })
hl("PreCondit", { fg = c.accent2 })
hl("Type", { fg = c.accent2 })
hl("StorageClass", { fg = c.accent2 })
hl("Structure", { fg = c.accent2 })
hl("Typedef", { fg = c.accent2 })
hl("Special", { fg = c.accent3 })
hl("SpecialChar", { fg = c.accent3 })
hl("Tag", { fg = c.accent3 })
hl("Delimiter", { fg = c.fg_dim })
hl("SpecialComment", { fg = c.comment })
hl("Debug", { fg = c.warn })
hl("Underlined", { underline = true })
hl("Ignore", { fg = c.gutter })
hl("Todo", { fg = c.info, bg = c.bg_alt, bold = true })

-- Treesitter
hl("@error", { fg = c.warm })
hl("@comment", { link = "Comment" })
hl("@comment.error", { fg = c.warm })
hl("@comment.warning", { fg = c.warn })
hl("@comment.todo", { fg = c.info, bold = true })
hl("@comment.note", { fg = c.hint, bold = true })
hl("@punctuation.delimiter", { fg = c.fg_dim })
hl("@punctuation.bracket", { fg = c.fg_dim })
hl("@punctuation.special", { fg = c.accent3 })
hl("@constant", { fg = c.accent1 })
hl("@constant.builtin", { fg = c.accent1 })
hl("@constant.macro", { fg = c.accent2 })
hl("@string", { fg = c.accent1, italic = true })
hl("@string.regex", { fg = c.accent1 })
hl("@string.escape", { fg = c.accent3 })
hl("@character", { fg = c.accent1 })
hl("@number", { fg = c.accent1 })
hl("@boolean", { fg = c.accent1 })
hl("@float", { fg = c.accent1 })
hl("@function", { fg = c.accent3 })
hl("@function.builtin", { fg = c.accent3 })
hl("@function.macro", { fg = c.accent3 })
hl("@function.call", { fg = c.accent3 })
hl("@method", { fg = c.accent3 })
hl("@method.call", { fg = c.accent3 })
hl("@constructor", { fg = c.accent2 })
hl("@parameter", { fg = c.fg_dim, italic = true })
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.accent2 })
hl("@type", { fg = c.accent2 })
hl("@type.builtin", { fg = c.accent2 })
hl("@type.qualifier", { fg = c.accent2 })
hl("@attribute", { fg = c.accent2 })
hl("@property", { fg = c.fg_dim })
hl("@field", { fg = c.fg_dim })
hl("@keyword", { fg = c.accent2, bold = true })
hl("@keyword.operator", { fg = c.accent2 })
hl("@keyword.function", { fg = c.accent2, bold = true })
hl("@keyword.return", { fg = c.accent2, bold = true })
hl("@operator", { fg = c.fg })
hl("@exception", { fg = c.warm })
hl("@include", { fg = c.accent2 })
hl("@label", { fg = c.accent2 })
hl("@namespace", { fg = c.accent3 })
hl("@symbol", { fg = c.accent1 })
hl("@text", { fg = c.fg })
hl("@text.title", { fg = c.accent2, bold = true })
hl("@text.literal", { fg = c.accent1 })
hl("@text.uri", { underline = true })
hl("@text.reference", { fg = c.accent3 })
hl("@tag", { fg = c.accent3 })
hl("@tag.attribute", { fg = c.fg_dim })
hl("@tag.delimiter", { fg = c.fg_dim })

-- LSP
hl("LspReferenceText", { bg = c.bg_alt })
hl("LspReferenceRead", { bg = c.bg_alt })
hl("LspReferenceWrite", { bg = c.bg_alt })
hl("LspCodeLens", { fg = c.comment })
hl("LspSignatureActiveParameter", { fg = c.accent3, bold = true })
hl("LspInlayHint", { fg = c.comment, bg = c.bg_alt })

-- Plugins comuns
hl("TelescopeNormal", { fg = c.fg, bg = c.bg_popup })
hl("TelescopeBorder", { fg = c.border, bg = c.bg_popup })
hl("TelescopeSelection", { fg = c.sel_fg, bg = c.sel_bg, bold = true })
hl("TelescopeSelectionCaret", { fg = c.accent1 })
hl("TelescopeTitle", { fg = c.fg, bold = true })
hl("TelescopePromptCounter", { fg = c.fg_dim })

hl("NotifyBackground", { bg = c.bg_popup })
hl("NotifyERRORBorder", { fg = c.warm })
hl("NotifyWARNBorder", { fg = c.warn })
hl("NotifyINFOBorder", { fg = c.info })
hl("NotifyDEBUGBorder", { fg = c.comment })
hl("NotifyTRACEBorder", { fg = c.accent2 })
hl("NotifyERRORTitle", { fg = c.warm })
hl("NotifyWARNTitle", { fg = c.warn })
hl("NotifyINFOTitle", { fg = c.info })
hl("NotifyDEBUGBody", { fg = c.fg })

hl("WhichKey", { fg = c.accent2 })
hl("WhichKeyGroup", { fg = c.accent3 })
hl("WhichKeyDesc", { fg = c.fg })
hl("WhichKeySeparator", { fg = c.comment })
hl("WhichKeyFloat", { bg = c.bg_popup })
hl("WhichKeyBorder", { fg = c.border, bg = c.bg_popup })

hl("LazyNormal", { fg = c.fg, bg = c.bg_popup })
hl("MasonNormal", { fg = c.fg, bg = c.bg_popup })
hl("NoiceCmdlinePopupBorder", { fg = c.border })
hl("NoiceCmdlineIcon", { fg = c.accent2 })
hl("DashboardHeader", { fg = c.accent2 })
hl("DashboardFooter", { fg = c.accent3 })

hl("IblIndent", { fg = c.gutter, nocombine = true })
hl("IblScope", { fg = c.border, nocombine = true })
hl("IndentBlanklineChar", { fg = c.gutter, nocombine = true })
hl("IndentBlanklineContextChar", { fg = c.accent2, nocombine = true })

hl("NeoTreeNormal", { fg = c.fg, bg = c.bg })
hl("NeoTreeNormalNC", { fg = c.fg, bg = c.bg })
hl("NeoTreeDirectoryName", { fg = c.accent3 })
hl("NeoTreeDirectoryIcon", { fg = c.accent3 })
hl("NeoTreeFileName", { fg = c.fg })
hl("NeoTreeIndentMarker", { fg = c.gutter })
hl("NeoTreeExpander", { fg = c.gutter })
hl("NeoTreeModified", { fg = c.warn })
hl("NeoTreeGitAdded", { fg = c.accent1 })
hl("NeoTreeGitDeleted", { fg = c.warm })
hl("NeoTreeGitModified", { fg = c.warn })

hl("BufferLineFill", { bg = c.bg })
hl("BufferLineBackground", { fg = c.fg_dim, bg = c.bg_alt })
hl("BufferLineBufferVisible", { fg = c.fg, bg = c.bg })
hl("BufferLineBufferSelected", { fg = c.fg, bg = c.bg, bold = true })
hl("BufferLineIndicatorSelected", { fg = c.accent1, bg = c.bg })

hl("GitSignsAdd", { fg = c.accent1 })
hl("GitSignsChange", { fg = c.accent3 })
hl("GitSignsDelete", { fg = c.warm })

hl("TroubleNormal", { fg = c.fg, bg = c.bg })
hl("TroubleText", { fg = c.fg_dim })
hl("TroubleCount", { fg = c.accent2, bg = c.bg_alt })

hl("CmpItemAbbr", { fg = c.fg })
hl("CmpItemAbbrMatch", { fg = c.accent3, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = c.accent3, bold = true })
hl("CmpItemMenu", { fg = c.comment })
hl("CmpItemKindFunction", { fg = c.accent3 })
hl("CmpItemKindMethod", { fg = c.accent3 })
hl("CmpItemKindKeyword", { fg = c.accent2 })

hl("BlinkCmpMenu", { fg = c.fg, bg = c.bg_popup })
hl("BlinkCmpMenuBorder", { fg = c.border, bg = c.bg_popup })
hl("BlinkCmpMenuSelection", { fg = c.sel_fg, bg = c.sel_bg })
hl("BlinkCmpLabelMatch", { fg = c.accent3, bold = true })
hl("BlinkCmpDoc", { fg = c.fg, bg = c.bg_popup })
hl("BlinkCmpDocBorder", { fg = c.border, bg = c.bg_popup })

hl("FlashMatch", { fg = c.fg, bg = c.bg_alt })
hl("FlashCurrent", { fg = c.sel_fg, bg = c.accent1 })
hl("FlashLabel", { fg = c.sel_fg, bg = c.accent2, bold = true })

-- Lualine (tema proprio tambem em lua/lualine/themes/oliva.lua)
hl("lualine_a_normal", { fg = c.sel_fg, bg = c.accent1, bold = true })
hl("lualine_b_normal", { fg = c.fg, bg = c.bg_alt })
hl("lualine_c_normal", { fg = c.fg_dim, bg = c.bg_status })
hl("lualine_a_insert", { fg = c.sel_fg, bg = c.accent3, bold = true })
hl("lualine_b_insert", { fg = c.accent3, bg = c.bg_alt })
hl("lualine_a_visual", { fg = c.sel_fg, bg = c.accent2, bold = true })
hl("lualine_b_visual", { fg = c.accent2, bg = c.bg_alt })
hl("lualine_a_replace", { fg = c.sel_fg, bg = c.warm, bold = true })
hl("lualine_a_command", { fg = c.sel_fg, bg = c.warn, bold = true })
hl("lualine_a_inactive", { fg = c.comment, bg = c.bg_alt })
hl("lualine_b_inactive", { fg = c.comment, bg = c.bg_alt })
hl("lualine_c_inactive", { fg = c.comment, bg = c.bg_status })

-- Terminal colors (para :terminal dentro do neovim)
vim.g.terminal_color_0 = c.bg_alt
vim.g.terminal_color_1 = c.warm
vim.g.terminal_color_2 = c.accent3
vim.g.terminal_color_3 = c.accent1
vim.g.terminal_color_4 = c.gutter
vim.g.terminal_color_5 = c.accent2
vim.g.terminal_color_6 = c.comment
vim.g.terminal_color_7 = c.fg
vim.g.terminal_color_8 = c.hl
vim.g.terminal_color_9 = "#A0723B"
vim.g.terminal_color_10 = c.fg_dim
vim.g.terminal_color_11 = "#DBDAD2"
vim.g.terminal_color_12 = c.fg
vim.g.terminal_color_13 = c.hint
vim.g.terminal_color_14 = "#888A85"
vim.g.terminal_color_15 = c.accent1
