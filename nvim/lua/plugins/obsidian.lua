return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = { "BufReadPre *.md", "BufNewFile *.md" },
  cmd = {
    "ObsidianBacklinks",
    "ObsidianDailies",
    "ObsidianExtractNote",
    "ObsidianFollowLink",
    "ObsidianLink",
    "ObsidianLinkNew",
    "ObsidianLinks",
    "ObsidianNew",
    "ObsidianNewFromTemplate",
    "ObsidianOpen",
    "ObsidianPasteImg",
    "ObsidianQuickSwitch",
    "ObsidianRename",
    "ObsidianSearch",
    "ObsidianTags",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianToggleCheckbox",
    "ObsidianTomorrow",
    "ObsidianTOC",
    "ObsidianYesterday",
  },
  keys = {
    { "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Obsidian backlinks" },
    { "<leader>od", "<cmd>ObsidianToday<CR>", desc = "Obsidian daily note" },
    { "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Obsidian note links" },
    { "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Open in Obsidian" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian quick switch" },
    { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian notes" },
    { "<leader>ot", "<cmd>ObsidianTemplate<CR>", desc = "Insert Obsidian template" },
    { "<leader>oT", "<cmd>ObsidianTOC<CR>", desc = "Obsidian table of contents" },
  },
  -- Sem "nvim-cmp": o LazyVim usa blink.cmp, e o obsidian.nvim >= 3.16 já
  -- entrega a completação pelo LSP embutido (obsidian-ls).
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "vault",
        path = "~/Documentos/Obsidian/Estudos/",
      },
    },
    daily_notes = {
      folder = "notes/dailies",
      date_format = "%Y-%m-%d",
    },
    -- As opções `nvim_cmp` e `blink` foram removidas na v3.16 (deprecadas);
    -- o que resta de configurável é isso:
    completion = {
      min_chars = 2,
      match_case = true,
      create_new = true,
    },
    -- Obs: a opção `mappings` foi deprecada no obsidian.nvim v3.16 e não tem
    -- mais efeito; os atalhos ficam em `keys` (acima) e nos defaults do plugin.
  },
}
