c = c

# Gruvbox Material Dark — mesma paleta do i3wm (~/.config/i3/config)
gb_bg = "#282828"     # i3 $bg
gb_base = "#3c3836"   # i3 $bg-brown
gb_fg = "#d4be98"     # i3 $fg / $text-color
gb_dim = "#a89984"    # i3 $gray
gb_yellow = "#d8a657"
gb_orange = "#e78a4e"
gb_red = "#ea6962"
gb_green = "#a9b665"
gb_aqua = "#89b482"
gb_blue = "#7daea3"
gb_purple = "#d3869b"

c.colors.statusbar.normal.bg = gb_bg
c.colors.statusbar.normal.fg = gb_fg
c.colors.statusbar.insert.bg = gb_green
c.colors.statusbar.insert.fg = gb_bg
c.colors.statusbar.command.bg = gb_base
c.colors.statusbar.command.fg = gb_fg
c.colors.statusbar.url.success.http.fg = gb_green
c.colors.statusbar.url.success.https.fg = gb_green
c.colors.statusbar.url.error.fg = gb_red
c.colors.statusbar.url.warn.fg = gb_yellow
c.colors.statusbar.url.hover.fg = gb_aqua

c.colors.tabs.bar.bg = gb_bg
c.colors.tabs.even.bg = gb_base
c.colors.tabs.even.fg = gb_dim
c.colors.tabs.odd.bg = gb_base
c.colors.tabs.odd.fg = gb_dim
c.colors.tabs.selected.even.bg = gb_orange
c.colors.tabs.selected.even.fg = gb_bg
c.colors.tabs.selected.odd.bg = gb_orange
c.colors.tabs.selected.odd.fg = gb_bg

c.colors.completion.odd.bg = gb_bg
c.colors.completion.even.bg = gb_base
c.colors.completion.fg = gb_fg
c.colors.completion.category.bg = gb_base
c.colors.completion.category.fg = gb_yellow
c.colors.completion.item.selected.bg = gb_blue
c.colors.completion.item.selected.fg = gb_bg
c.colors.completion.match.fg = gb_orange

c.colors.webpage.bg = gb_bg
c.colors.prompts.bg = gb_base
c.colors.prompts.fg = gb_fg
c.colors.hints.bg = gb_yellow
c.colors.hints.fg = gb_bg
c.colors.messages.info.bg = gb_base
c.colors.messages.info.fg = gb_fg
c.colors.messages.error.bg = gb_red
c.colors.messages.error.fg = gb_bg
c.colors.messages.warning.bg = gb_orange
c.colors.messages.warning.fg = gb_bg