-- =============================================================
-- Tema: Achroma (https://github.com/binbandit/achroma.nvim)
--
-- Tema monocromatico (preto / cinza / branco) igual ao do Alacritty
-- (~/.config/alacritty/alacritty.toml).
--
-- variant = "black" => fundo preto puro (#000000), texto branco/cinza,
-- sem nenhuma cor de destaque. Use `pop = true` se quiser que erros,
-- strings e keywords ganhem cor.
-- =============================================================

return {
  {
    "binbandit/achroma.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "black",
      transparent = false,
    },
    config = function(_, opts)
      -- o colors/achroma.lua reaplica setup({ mode = ... }) sem a variant,
      -- entao forcamos nossas opcoes por baixo pra manter o fundo preto
      local achroma = require("achroma")
      local setup = achroma.setup
      achroma.setup = function(o)
        return setup(vim.tbl_deep_extend("force", opts, o or {}))
      end
      vim.cmd.colorscheme("achroma")
    end,
  },

  -- LazyVim usa essa opção para saber qual é o tema atual (lualine "auto" etc.)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "achroma",
    },
  },

  -- achroma.nvim já traz um tema de lualine próprio (preto/cinza).
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "achroma",
      },
    },
  },
}
