-- =============================================================
-- Tema: oliva (paleta sepia/verde-oliva do i3wm + wallpaper verde)
--
-- Colorscheme proprio, definido em ~/.config/nvim/colors/oliva.lua.
-- Mesma paleta do kitty, alacritty, i3bar, rofi e dunst:
--   fundo #15190F | texto #A4A479 | destaque #797B53
-- =============================================================

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oliva",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "oliva",
      },
    },
  },
}
