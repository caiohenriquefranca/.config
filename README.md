# dotfiles — `~/.config`

Configurações do meu ambiente de desenvolvimento e do **i3wm**, todas com o
tema **Gruvbox Material Dark**.

O repositório vive direto em `~/.config` — ou seja, é o próprio diretório de
configuração da máquina versionado em git, com um `.gitignore` em modo
"allowlist": **só sobe o que eu decidi que vale a pena**, nunca caches,
cookies ou dados de aplicativos.

## Estrutura

| Pasta | O que é | Dependência principal |
| --- | --- | --- |
| `alacritty/` | Terminal | [Alacritty](https://alacritty.org) |
| `autostart/` | Apps iniciados com a sessão (Bitwarden) | — |
| `dunst/` | Notificações | [dunst](https://dunst-project.org) |
| `fastfetch/` | Fetch do sistema (logo via chafa) | [fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| `i3/` | WM: bindings, `monitors.sh`, scripts da barra | [i3](https://i3wm.org) / i3-gaps |
| `neofetch/` | Fetch antigo (ASCII/imagem do Newton) | [neofetch](https://github.com/dylanaraps/neofetch) |
| `nvim/` | Editor (LazyVim + lazy.nvim) | [Neovim](https://neovim.io) + [LazyVim](https://www.lazyvim.org) |
| `opencode/` | CLI de IA para dev (só a config) | [opencode](https://opencode.ai) |
| `picom/` | Compositor (transparência/blur) | [picom](https://github.com/yshui/picom) |
| `polybar/` | Barra de status (tags + título da janela) | [polybar](https://github.com/polybar/polybar) |
| `qutebrowser/` | Navegador (config + bookmarks) | [qutebrowser](https://qutebrowser.org) |
| `rofi/` | Lançador de apps/comandos | [rofi](https://github.com/davatorium/rofi) |
| `tmux/` | Multiplexador de terminal | [tmux](https://github.com/tmux/tmux) |
| `VSCodium/` | IDE (só `User/settings.json` + snippets) | [VSCodium](https://vscodium.com) |
| `wallpapers/` | Papeis de parede | — |

## Instalação / uso

Como o repositório **é** o `~/.config`, ele já fica no lugar:

```sh
# em uma maquina nova (com ~/.config existente, unir com cuidado)
mkdir -p ~/.config
git clone git@github.com:caiohenriquefranca/.config.git ~/.config
```

### Dependências principais

- i3 (gaps ativados) + `xrandr` + `feh` (wallpaper)
- polybar, rofi, dunst, picom
- Alacritty, tmux, Neovim (LazyVim), qutebrowser, VSCodium
- playerctl, pulsemixer/pactl, nm-applet, xss-lock
- Fonte: **NotoMono Nerd Font Mono** (+ Noto Color Emoji)

### Wallpaper e monitores

O wallpaper vive em `wallpapers/wallpaper.jpeg`. O `i3/monitors.sh` descobre os
outputs em tempo real (o nome do painel muda no NVIDIA PRIME entre sessões),
aplica o layout **1920x1080** (interno 120Hz, externo 100Hz) e seta o papel via
`feh`. Padrões podem ser sobrescritos por variáveis de ambiente:

```sh
WALLPAPER=/path/imagem monitors.sh
INTERNAL_SIDE=left MODE=2560x1440 monitors.sh
```

### Atalhos do i3 (resumo)

`$mod` = **Super (Mod4)**

| Atalho | Ação |
| --- | --- |
| `$mod+Enter` | Abre o Alacritty |
| `$mod+d` / `$mod+;` | rofi run / rofi drun |
| `$mod+b` / `$mod+c` | brave / VSCodium |
| `$mod+Shift+q` | Fecha a janela |
| `$mod+f` | Fullscreen |
| `$mod+Shift+space` | Toggle float |
| `$mod+h/j/k/l` (ou setas) | Foco |
| `$mod+Shift+h/j/k/l` | Move janela |
| `$mod+1..0` / `$mod+Shift+1..0` | Workspaces / mover janela |
| `$mod+r` | Modo resize |
| `$mod+Escape` | Menu de sistema (lock/logout/suspend/…) |
| `$mod+x` / `$mod+y` | Screenshot (janela / root) |
| `Volume`/`Brilho` | Atalhos multimídia |

## Notas

- `VSCodium/`, `opencode/` e `qutebrowser/` entram só com o essencial — cada um
  tem um `.gitignore` interno filtrando state de maquina/cache.
- O `.gitignore` da raiz usa allowlist: adicionar uma config nova = criar uma
  linha `!config/` nele.
- Tema unificado: Gruvbox Material Dark nos arquivos de i3, polybar, alacritty,
  qutebrowser e neovim.

## Licença

Sinta-se livre para usar como base para o seu próprio ambiente.