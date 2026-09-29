-- Tema do lualine para o Vague (https://github.com/vague-theme/vague.nvim)
--
-- O vague.nvim nao traz um extra de lualine, e o modo "auto" do lualine
-- cai no PmenuThumb (#606079, cinza-arroxeado) — ruim demais para o
-- indicador de modo. Aqui cada modo usa uma cor da paleta do vague,
-- com fundo preto no estilo "dark" e o `line` nas secoes b/c.

local ok, colors = pcall(function()
  return require("vague").get_palette()
end)

if not ok then
  colors = {
    bg = "#141415",
    inactiveBg = "#1c1c24",
    fg = "#cdcdcd",
    line = "#252530",
    comment = "#606079",
    constant = "#aeaed1",
    error = "#d8647e",
    warning = "#f3be7c",
    hint = "#7e98e8",
    string = "#e8b589",
    func = "#c48282",
    keyword = "#6e94b2",
  }
end

local c = colors

local M = {}

M.normal = {
  a = { fg = c.bg, bg = c.comment, gui = "bold" },
  b = { fg = c.fg, bg = c.line },
  c = { fg = c.comment, bg = c.bg },
}
M.insert = {
  a = { fg = c.bg, bg = c.string, gui = "bold" },
  b = { fg = c.fg, bg = c.line },
  c = { fg = c.comment, bg = c.bg },
}
M.visual = {
  a = { fg = c.bg, bg = c.constant, gui = "bold" },
  b = { fg = c.fg, bg = c.line },
  c = { fg = c.comment, bg = c.bg },
}
M.replace = {
  a = { fg = c.bg, bg = c.warning, gui = "bold" },
  b = { fg = c.fg, bg = c.line },
  c = { fg = c.comment, bg = c.bg },
}
M.command = {
  a = { fg = c.bg, bg = c.hint, gui = "bold" },
  b = { fg = c.fg, bg = c.line },
  c = { fg = c.comment, bg = c.bg },
}
M.terminal = {
  a = { fg = c.bg, bg = c.keyword, gui = "bold" },
  b = { fg = c.fg, bg = c.line },
  c = { fg = c.comment, bg = c.bg },
}
M.inactive = {
  a = { fg = c.comment, bg = c.inactiveBg, gui = "bold" },
  b = { fg = c.comment, bg = c.inactiveBg },
  c = { fg = c.comment, bg = c.inactiveBg },
}

return M
