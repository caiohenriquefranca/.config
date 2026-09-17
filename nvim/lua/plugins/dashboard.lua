return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          -- Renderização em Braille com tamanho calculado pelo terminal
          -- (o valor fixo 60x60 estourava terminais menores)
          function()
            local rows = vim.o.lines
            local height = math.max(10, math.min(rows - 11, 30))
            local width = math.floor(height * 1.6)
            return {
              section = "terminal",
              cmd = ("chafa -f symbols --symbols braille --colors full --center on --size %dx%d ~/.config/neofetch/isaac-newton.jpg"):format(width, height),
              height = height,
              padding = 0,
              ttl = 0,
            }
          end,
          -- Menu de opções do LazyVim abaixo da imagem
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
