#!/usr/bin/env sh
# monitors.sh -- define o layout das telas no i3wm (X11 + xrandr).
#
# Por que este script existe:
#   No driver NVIDIA (PRIME) os nomes dos outputs mudam entre sessoes
#   (eDP-1-0, eDP-1-1, ...). Com o nome fixo no config do i3, o xrandr apenas
#   imprime "warning: output eDP-1-1 not found; ignoring" e descarta tambem as
#   regras de posicao/primary daquele output -- resultado: as duas telas ficam
#   em +0+0, ou seja, espelhadas. Aqui os outputs sao descobertos em tempo real.
#
# Uso:  monitors.sh
#
# Variaveis de ambiente opcionais:
#   INTERNAL_SIDE=right|left   lado do painel do notebook    (padrao: right)
#   MODE=1920x1080             resolucao aplicada nas telas  (padrao: 1920x1080)
#   RATE_INTERNAL=120          taxa do painel interno        (padrao: 120)
#   RATE_EXTERNAL=100          taxa do monitor externo       (padrao: 100)
#   WALLPAPER=/caminho/img     papel de parede               (padrao: ~/.config/wallpapers/wallpaper.jpeg)
#   RESTART_BAR=0|1            reinicia a polybar no final   (padrao: 1)

set -eu

MODE="${MODE:-1920x1080}"
RATE_INTERNAL="${RATE_INTERNAL:-120}"
RATE_EXTERNAL="${RATE_EXTERNAL:-100}"
INTERNAL_SIDE="${INTERNAL_SIDE:-right}"
WALLPAPER="${WALLPAPER:-$HOME/.config/wallpapers/wallpaper.jpeg}"
RESTART_BAR="${RESTART_BAR:-1}"
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/monitors"
MODE_W="${MODE%%x*}"
MODE_H="${MODE#*x}"

command -v xrandr >/dev/null 2>&1 || { echo "monitors.sh: xrandr nao encontrado" >&2; exit 1; }

# ---------------------------------------------------------------------------
# 1. descobre os outputs: painel interno (eDP/LVDS/DSI) x monitores externos
# ---------------------------------------------------------------------------
internal=""
externals=""
for out in $(xrandr --query | awk '/ connected/ {print $1}'); do
    case "$out" in
        eDP*|LVDS*|DSI*) internal="$out" ;;
        *) externals="$externals $out" ;;
    esac
done

# ---------------------------------------------------------------------------
# 2. monta e aplica o layout (posicoes absolutas, sempre x >= 0)
#    $INTERNAL_SIDE define o lado do painel do notebook; o lado oposto recebe
#    os monitores externos.
# ---------------------------------------------------------------------------
build_layout() {
    if [ "$INTERNAL_SIDE" = "left" ]; then
        order="$internal $externals"
    else
        order="$externals $internal"
    fi

    # --fb: evita a falha silenciosa quando o framebuffer atual e menor que o
    # layout novo (caso tipico: telas espelhadas em 1920x1080 com dois crtcs).
    cmd="xrandr --fb $((MODE_W * connected_count))x$MODE_H"
    x=0
    for out in $order; do
        pri=""
        rate="$RATE_EXTERNAL"
        if [ -n "$internal" ] && [ "$out" = "$internal" ]; then
            pri="--primary"
            rate="$RATE_INTERNAL"
        fi
        cmd="$cmd --output $out $pri --mode $MODE --rate $rate --pos ${x}x0"
        x=$((x + MODE_W))
    done
    printf '%s\n' "$cmd"
}

# plano B: usa o modo preferido de cada tela (--auto), encadeando a direita.
# Util quando algum monitor nao aceita $MODE.
build_layout_auto() {
    if [ "$INTERNAL_SIDE" = "left" ]; then
        order="$internal $externals"
    else
        order="$externals $internal"
    fi

    cmd="xrandr"
    ref=""
    for out in $order; do
        if [ -z "$ref" ]; then
            cmd="$cmd --output $out --auto --pos 0x0"
        else
            cmd="$cmd --output $out --auto --right-of $ref"
        fi
        ref="$out"
    done
    printf '%s\n' "$cmd"
}

# 0 (sucesso) = existe tela sobreposta/espelhada, 1 = layout ok
has_overlap() {
    xrandr --query | awk '
        $2 == "connected" {
            geom = ""
            for (i = 2; i <= NF; i++)
                if ($i ~ /^[0-9]+x[0-9]+\+[0-9]+\+[0-9]+$/) { geom = $i; break }
            if (geom == "") next
            n++
            split(geom, g, /[x+]/)
            w[n] = g[1] + 0; h[n] = g[2] + 0; px[n] = g[3] + 0; py[n] = g[4] + 0
        }
        END {
            for (i = 1; i <= n; i++)
                for (j = i + 1; j <= n; j++)
                    if (px[i] < px[j] + w[j] && px[j] < px[i] + w[i] &&
                        py[i] < py[j] + h[j] && py[j] < py[i] + h[i]) exit 0
            exit 1
        }'
}

# 0 (sucesso) = algum output conectado nao esta em $MODE, 1 = todos em $MODE
has_bad_mode() {
    xrandr --query | awk -v mode="$MODE" '
        $2 == "connected" {
            geo = ""
            for (i = 2; i <= NF; i++)
                if ($i ~ /^[0-9]+x[0-9]+\+/) { geo = $i; break }
            if (geo == "") next
            if (index(geo, mode) != 1) bad = 1
        }
        END { exit bad ? 0 : 1 }'
}

connected_count=$(xrandr --query | awk '/ connected/ {c++} END {print c + 0}')
if [ "$connected_count" -gt 0 ]; then
    # shellcheck disable=SC2046
    set -- $(build_layout)
    "$@" || true

    if has_overlap || has_bad_mode; then
        echo "monitors.sh: layout $MODE nao ficou OK, tentando modo preferido (--auto)" >&2
        # shellcheck disable=SC2046
        set -- $(build_layout_auto)
        "$@" || true
        if [ -n "$internal" ]; then
            xrandr --output "$internal" --primary || true
        fi
    fi

    if has_overlap; then
        echo "monitors.sh: AVISO - as telas continuam sobrepostas:" >&2
        xrandr --query | awk '/ connected/ {print "  " $0}' >&2
    fi
fi

xrandr --query | awk '/ connected/ {print "monitors.sh: " $0}' >&2

# ---------------------------------------------------------------------------
# 3. papel de parede
#    Uma unica imagem no desktop inteiro (comportamento padrao do i3/feh),
#    como era antes -- nao duplica o wallpaper em cada tela.
# ---------------------------------------------------------------------------
apply_wallpaper() {
    [ -n "$WALLPAPER" ] && [ -r "$WALLPAPER" ] || return 0
    feh --no-fehbg --bg-fill "$WALLPAPER" >/dev/null 2>&1 || true
}

apply_wallpaper

# ---------------------------------------------------------------------------
# 4. reinicia a polybar depois do layout definido, senao launch.sh nao encontra
#    um monitor "primary" e sobe a barra em apenas uma tela
# ---------------------------------------------------------------------------
if [ "$RESTART_BAR" = "1" ] && [ -x "$HOME/.config/polybar/launch.sh" ]; then
    "$HOME/.config/polybar/launch.sh"
fi
