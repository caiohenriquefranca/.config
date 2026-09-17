-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- ===== Aparência (espelha o visual enxuto do i3) =====
opt.termguicolors = true -- truecolor: obrigatório para o gruvbox-material
opt.fillchars:append({ eob = " " }) -- remove os "~" no fim do buffer
opt.list = true -- mostra tabs e espaços excedentes
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.winblend = 0 -- floats opacos (o alacritty já usa opacity 0.9)
opt.pumblend = 0 -- menu de completação opaco
opt.showmode = false -- o modo já aparece na lualine

-- ===== Navegação =====
opt.scrolloff = 8 -- linhas de contexto ao rolar
opt.sidescrolloff = 8
opt.pumheight = 10 -- altura máxima do menu de completação
