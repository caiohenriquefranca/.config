-- Tema do lualine para o colorscheme "oliva"
-- (~/.config/nvim/colors/oliva.lua). Mesma paleta sepia/verde-oliva
-- usada no kitty, alacritty, i3bar, rofi e dunst.

local c = {
  bg        = "#15190F",
  bg_alt    = "#2B3321",
  bg_status = "#2B3321",
  fg        = "#A4A479",
  fg_dim    = "#939470",
  comment   = "#6D7053",
  accent1   = "#C6C396",
  accent2   = "#9F9F78",
  accent3   = "#797B53",
  warm      = "#784421",
  warn      = "#A0723B",
  sel_fg    = "#12150D",
}

local M = {}

M.normal = {
  a = { fg = c.sel_fg, bg = c.accent1, gui = "bold" },
  b = { fg = c.fg, bg = c.bg_alt },
  c = { fg = c.fg_dim, bg = c.bg_status },
}
M.insert = {
  a = { fg = c.sel_fg, bg = c.accent3, gui = "bold" },
  b = { fg = c.accent3, bg = c.bg_alt },
  c = { fg = c.fg_dim, bg = c.bg_status },
}
M.visual = {
  a = { fg = c.sel_fg, bg = c.accent2, gui = "bold" },
  b = { fg = c.accent2, bg = c.bg_alt },
  c = { fg = c.fg_dim, bg = c.bg_status },
}
M.replace = {
  a = { fg = c.sel_fg, bg = c.warm, gui = "bold" },
  b = { fg = c.warm, bg = c.bg_alt },
  c = { fg = c.fg_dim, bg = c.bg_status },
}
M.command = {
  a = { fg = c.sel_fg, bg = c.warn, gui = "bold" },
  b = { fg = c.warn, bg = c.bg_alt },
  c = { fg = c.fg_dim, bg = c.bg_status },
}
M.terminal = {
  a = { fg = c.sel_fg, bg = c.accent3, gui = "bold" },
  b = { fg = c.accent3, bg = c.bg_alt },
  c = { fg = c.fg_dim, bg = c.bg_status },
}
M.inactive = {
  a = { fg = c.comment, bg = c.bg_alt, gui = "bold" },
  b = { fg = c.comment, bg = c.bg_alt },
  c = { fg = c.comment, bg = c.bg_status },
}

return M
