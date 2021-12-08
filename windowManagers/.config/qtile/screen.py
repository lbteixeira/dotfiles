from libqtile import qtile

from libqtile import bar, widget
from libqtile.config import Screen

mod = "mod4"
terminal = "alacritty"
main_font = "Roboto Mono Nerd Font"
main_font_bold = "Fira Mono Nerd Font Bold"
gruv_colors = ["#665c54", "#ebdbb2", "#3b4252", "#fabd2f", "#504945","#fabd2f"]

def screen() -> Screen:
    
    screen = Screen(
        top=bar.Bar([
            widget.Sep(
                background = gruv_colors[0],
                padding = 5,
                linewidth = 0,
                ),
            # widget.Image(
                # filename = '~/Pictures/icons/LTgruv.png',
                # background = gruv_colors[0],
                # ),
            widget.GroupBox(
                margin_y = 3,
                margin_x = 2,
                padding_y = 5,
                padding_x = 5,
                borderwidth = 4,
                active = gruv_colors[3],
                inactive = gruv_colors[1],
                rounded = True,
                highlight_color = gruv_colors[2],
                highlight_method = "line",
                this_current_screen_border = gruv_colors[1],
                this_screen_border = gruv_colors[1],
                other_current_screen_border = gruv_colors[5],
                other_screen_border = gruv_colors[5],
                fontsize = 20,
                foreground = gruv_colors[1],
                background = gruv_colors[0]),

            widget.Sep(
                linewidth = 4,
                padding = 10,
                foreground = gruv_colors[0],
                background = gruv_colors[0],),

            widget.Spacer(background = gruv_colors[0],),

            widget.CurrentLayoutIcon(
                foreground = gruv_colors[1],
                background = gruv_colors[0],),

            widget.Sep(linewidth = 0,
                padding = 4,
                foreground = gruv_colors[0],
                background = gruv_colors[1]),

            widget.TextBox(
                text = "",
                foreground = gruv_colors[0],
                background = gruv_colors[1],
                padding = 2,
                fontsize = 18),

            widget.Memory(
                foreground = gruv_colors[0],
                background = gruv_colors[1],
                measure_mem = 'G',
                mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
                format='{MemUsed:.1f}GB|{MemTotal:.1f}GB'),

            widget.Systray(
                background=gruv_colors[1],
                icons_size=20,
                padding=4),

            widget.Sep(linewidth = 0,
                padding = 10,
                foreground = gruv_colors[1],
                background = gruv_colors[0]),

            widget.TextBox(
                   text = ' ',
                   foreground = gruv_colors[1],
                   background = gruv_colors[0],
                   padding = 0,
                   fontsize = 20),

            widget.KeyboardLayout(
                configured_keyboards=['us', 'br', 'fr'],            
                foreground = gruv_colors[1],
                background = gruv_colors[0],
                padding=5),

            widget.TextBox(
                   text = '墳',
                   foreground = gruv_colors[0],
                   background = gruv_colors[1],
                   padding = 6,
                   fontsize = 20),

            widget.Volume(
                foreground = gruv_colors[0],
                background = gruv_colors[1],
                mouse_callbacks = {'Button3': lambda: qtile.cmd_spawn("alsamixer")}),

            widget.Sep(
                linewidth = 0,
                padding = 6,
                foreground = gruv_colors[0],
                background = gruv_colors[1],),

            widget.TextBox(
                text=' ',
                fontsize='15',
                foreground = gruv_colors[1],
                background = gruv_colors[0],),

            widget.Battery(
                foreground = gruv_colors[1],
                background = gruv_colors[0],
                charge_char='↑',
                discharge_char='↓',
                update_interval=1,
                format='{percent:2.0%}'),

            widget.TextBox(
                text='',
                fontsize = 20,
                padding = 9,
                foreground = gruv_colors[0],
                background = gruv_colors[1],
                mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' calcurse')},),

            widget.Clock(
                font = main_font_bold,
                fontsize = 18,
                foreground = gruv_colors[0],
                background = gruv_colors[1],
                format='%d/%m %a | %H:%M',
                mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' calcurse')},),

            widget.Sep(
                padding = 6,
                linewidth = 0,
                foreground = gruv_colors[0],
                background = gruv_colors[1],
                mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' calcurse')},),
            ],
            27,
            background=gruv_colors[1],
            margin=[6,7,0,7],
            opacity= 0.9),
    )

    return screen
