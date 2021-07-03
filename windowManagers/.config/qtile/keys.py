""" Qtile keybindings """

from typing import List

from libqtile.config import Key
from libqtile.lazy import lazy

mod = "mod4"
terminal = "st"

def keys() -> List:

    keys = [
        # Switch between windows
        Key([mod], "h", lazy.layout.left()),
        Key([mod], "l", lazy.layout.right()),
        Key([mod], "j", lazy.layout.down()),
        Key([mod], "k", lazy.layout.up()),
        Key([mod, "mod1"], "space",
            lazy.widget["keyboardlayout"].next_keyboard()),

        # Move windows left/right columns or up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

        # Grow windows.
        Key([mod, "control"], "h", lazy.layout.grow_left()),
        Key([mod, "control"], "l", lazy.layout.grow_right()),
        Key([mod, "control"], "j", lazy.layout.grow_down()),
        Key([mod, "control"], "k", lazy.layout.grow_up()),
        Key([mod], "n", lazy.layout.normalize()),

        # Toggle between split and unsplit sides of stack.
        # Split = all windows displayed
        # Unsplit = 1 window displayed, like Max layout, but still with
        # multiple stack panes
        Key([mod, "shift"], "Return", lazy.layout.toggle_split()),

        Key([mod], "Return", lazy.spawn(terminal)),

        # Toggle between different layouts as defined below
        Key([mod], "space", lazy.next_layout()),
        Key([mod], "Tab", lazy.screen.toggle_group()),
        Key(["mod1"], "Tab", lazy.next_screen()),
        Key([mod], "w", lazy.window.kill()),

        Key([mod, "control"], "r", lazy.restart()),
        Key([mod, "control"], "q", lazy.shutdown()),

        Key([mod], "r", lazy.spawncmd()),

        # Key([mod], "p", lazy.spawn("dmenu_run -n -m 0 -l 10")),
        Key([mod], "p", lazy.spawn("dmenu_run -h 34")),
        Key([mod], "f", lazy.spawn("firefox")),
        Key([mod], "v", lazy.spawn(terminal + " vifm")),
        Key([mod], "z", lazy.spawn("zathura")),
        Key([mod], "q", lazy.spawn("qutebrowser")),

        Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 2%+")),
        Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 2%-")),
        Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),

        Key([mod], "equal", lazy.spawn("amixer set 'Master' 2%+")),
        Key([mod], "minus", lazy.spawn("amixer set 'Master' 2%+")),

        Key([mod, "mod1"], "l", lazy.spawn("slock")),
        ]

    return keys
