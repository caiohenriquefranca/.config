-- =============================================================
-- Tema: Vague (https://github.com/vague-theme/vague.nvim)
--
-- Fundo preto puro (#000000) igual ao do Alacritty
-- (~/.config/alacritty/alacritty.toml), mantendo o resto da paleta
-- original do Vague. As cores escuras derivadas (line, inactiveBg)
-- tambem foram escurecidas para nao destoar do fundo preto.
-- =============================================================

return {
  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      bold = true,
      italic = true,
      colors = {
        -- original: bg #141415 | inactiveBg #1c1c24 | line #252530
        bg = "#000000",
        inactiveBg = "#0a0a0c",
        line = "#141418",
      },
    },
    config = function(_, opts)
      require("vague").setup(opts)
      vim.cmd.colorscheme("vague")
    end,
  },

  -- LazyVim usa essa opção para saber qual é o tema atual (lualine "auto" etc.)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vague",
    },
  },

  -- vague.nvim não traz extra de lualine, e o "auto" ficaria com o cinza do
  -- PmenuThumb como indicador de modo. ~/.config/nvim/lua/lualine/themes/vague.lua
  -- usa a própria paleta do vague e segue o fundo preto.
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "vague",
      },
    },
  },
}
