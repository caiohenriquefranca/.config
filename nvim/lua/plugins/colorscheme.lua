-- =============================================================
-- Tema: Gruvbox Material alinhado à paleta do i3wm (~/.config/i3/config)
--   i3 $bg       #282828 | $bg-brown #3c3836 | $bg-alt #504945
--   i3 $fg       #d4be98 | $orange   #e78a4e | $red    #ea6962
--   i3 $green    #a9b665 | $yellow   #d8a657 | $blue   #7daea3
--   i3 $purple   #d3869b | $aqua     #89b482 | $gray   #a89984
-- =============================================================

return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- O i3 usa o ramp clássico de fundos #282828 / #3c3836 / #504945.
      -- No gruvbox-material isso é o "hard", cujo único desvio é o bg0
      -- (#1d2021, mais escuro que as janelas do i3) — sobrescrito abaixo.
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_colors_override = {
        bg0 = { "#282828", "235" },
      }
      -- "material" => fg #d4be98 ("original" traria o #ebdbb2 do gruvbox clássico)
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_diagnostic_text_highlight = true
      vim.g.gruvbox_material_diagnostic_line_highlight = true
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_current_word = "grey background"
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")
    end,
  },

  -- LazyVim usa essa opção para saber qual é o tema atual (lualine "auto" etc.)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
