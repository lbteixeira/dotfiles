# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
import os
import subprocess

from typing import List  # noqa: F401

from libqtile import layout, hook
from libqtile.config import Click, Drag, Group, Key
from libqtile.lazy import lazy
from keys import keys
from screen import screen

mod = "mod4"
terminal = "st"
main_font = "Roboto Mono Nerd Font"
main_font_bold = "Fira Mono Nerd Font Bold"

keys = keys()

groups = [Group(i) for i in "123456789"]

groups_definition = [{"name": "1", "label": "1"},
                     {"name": "2", "label": "2"},
                     {"name": "3", "label": "3"},
                     {"name": "4", "label": "4"},
                     {"name": "5", "label": "5"},
                     {"name": "6", "label": ""},
                     {"name": "7", "label": ""},
                     {"name": "8", "label": ""},
                     {"name": "9", "label": ""},
                     ]

groups = []
for g in groups_definition:
    groups.append(Group(name=g["name"], label=g["label"]))

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True))
        ])

gruv_colors = ["#665c54", "#ebdbb2", "#3b4252", "#fabd2f", "#504945"]

layouts = [
    layout.Columns(border_width=2, margin=5, margin_on_single=5, \
                   border_focus=gruv_colors[1], border_normal=gruv_colors[0], \
                   insert_position=1, border_on_single=True),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(**layout_theme),
    # layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(**layout_theme),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font=main_font,
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screen1 = screen()
screen2 = screen()

screens = [screen1, screen2]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/start_once.sh')
    subprocess.call([home])

@hook.subscribe.startup
def start():
    home = os.path.expanduser('~/.config/qtile/start.sh')
    subprocess.call([home])

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},
    {'wmclass': 'makebranch'},
    {'wmclass': 'maketag'},
    {'wname': 'branchdialog'},
    {'wname': 'pinentry'},
    {'wmclass': 'ssh-askpass'},
    {'wmclass': 'nitrogen'},
    {'wmclass': 'Thunar'},
    {'wmclass': 'galculator'},
    {'wmclass': 'viewnior'},
    {'wmclass': 'ij-ImageJ'},
    {'wmclass': 'Msgcompose'},
    {'wmclass': 'matplotlib'},
    {'wmclass': 'pcmanfm'},
    {'wmclass': 'org.gnome.DejaDup'},
    {'wname': 'Enter LaTeX Formula - TexText 1.2.0'},
    {'wname': 'Feed Subscriptions'},
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
