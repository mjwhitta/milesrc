#!/usr/bin/env bash

if [[ -z $TMUX ]]; then
    echo "Not in a tmux session"
    exit
fi

tvers="$(tmux -V | grep -ioPs "\d+\.\d+" | tr -d ".")"
if [[ $tvers -lt 24 ]]; then
    echo "Your version of tmux is too old: $(tmux -V)"
    echo "Please install something newer than or equal to 2.4"
    exit
fi

# {{{ Default values
tmux set -g @battery_bar_size "5"
tmux set -g @battery_bar_spacer ""
tmux set -g @battery_bar_surround "[]"
tmux set -g @battery_charging "⚡️"
tmux set -g @battery_empty "□"
tmux set -g @battery_filled "■"
# tmux set -g @battery_empty "♡"
# tmux set -g @battery_filled "❤"
tmux set -g @default_ctrl_d "on"
tmux set -g @log_name "tmux-%Y%m%d-%H%M%S.log"
tmux set -g @log_path "#{pane_current_path}"
tmux set -g @prefix "C-a"
tmux set -g @resize "5"
tmux set -g @shell "$SHELL"
tmux set -g @term "tmux-256color"
tmux set -g @ui_style "bg=blue,fg=white"

# Let user override values before continuing
if [[ -f "$HOME/.tmux/tmux.override" ]]; then
    tmux source "$HOME/.tmux/tmux.override"
fi
# }}}

# {{{ Helper functions and variables
# Background color
function bcolor() { bground | awk -F "=" '{print $2}'; }

# Background style
function bground() { tget -g @ui_style | grep -oPs "bg=[^,]+"; }

# Foreground color
function fcolor() { fground | awk -F "=" '{print $2}'; }

# Foreground style
function fground() { tget -g @ui_style | grep -oPs "fg=[^,]+"; }

# Create a tmux if statement
function if_then_else() { echo "#{$1,$2,$3}"; }

# Lazy get tmux option with format strings
function tfget() { tfstr "$(tlget "$@")"; }

# Get a tmux formatted string
function tfstr() { echo -n "\$(tmux display -p \"$*\")"; }

# Get tmux option
function tget() { tmux show -qv "$@"; }

# Lazy get tmux option (lazy-loading)
function tlget() { echo "\$(tmux show -qv $*)"; }
# }}}

# {{{ Settings
tmux set -gw aggressive-resize "on"
tmux set -gw allow-rename "on"
tmux set -gw alternate-screen "on"
tmux set -gw automatic-rename "off"
tmux set -gw clock-mode-style "12"
tmux set -g default-command "$(tget -g @shell)"
if [[ -n $(command -v reattach-to-user-namespace) ]]; then
    tmux set -g default-command \
        "reattach-to-user-namespace -l $(tget -g @shell)"
fi
tmux set -s default-terminal "$(tget -g @term)"
tmux set -g display-time "4000"
tmux set -s escape-time "0"
tmux set -g focus-events "on"
tmux set -u history-file
tmux set -g history-limit "999999"
tmux set -gw mode-keys "vi"
tmux set -gw monitor-activity "on"
tmux set -gqw monitor-bell "on"
tmux set -gw monitor-silence "0"
tmux set -gw mouse "on"
tmux set -g prefix "$(tget -g @prefix)"
tmux set -g renumber-windows "on"
tmux set -g status-interval "5"
tmux set -ag terminal-overrides ",*256col*:Tc"

# Colors
tmux set -gw clock-mode-colour "$(bcolor)"
tmux set -g message-style "$(tget -g @ui_style)"
tmux set -gw mode-style "$(tget -g @ui_style)"
tmux set -g pane-active-border-style "fg=$(fcolor)"
tmux set -g pane-border-style "fg=$(bcolor)"
tmux set -g status-style "$(tget -g @ui_style)"
tmux set -gw window-status-activity-style "bg=$(fcolor),fg=$(bcolor)"
tmux set -gw window-status-bell-style "bg=$(fcolor),fg=$(bcolor)"
tmux set -gw window-status-current-style "bg=$(fcolor),fg=$(bcolor)"

# Status bar
tmux set -g status-justify "left"
tmux set -g status-keys "emacs"
tmux set -g status-left-length "16"
tmux set -g status-right "$(
    if_then_else "?client_prefix" \
    "#[bg=$(fcolor)]#[fg=$(bcolor)] $(tget -g @prefix) #[default] " ""
)"
tmux set -ag status-right "$(
    if_then_else "?pane_in_mode" \
    "#[bg=$(fcolor)]#[fg=$(bcolor)] #{pane_mode} #[default] " ""
)"
if [[ -n $(command -v acpi) ]] || [[ -n $(command -v pmset) ]]; then
    tmux set -ag status-right "#(
        if [[ -n \$(command -v acpi) ]]; then
            no_batt=\"\$(
                acpi 2>&1 | grep -Ps \"^No support.+power_supply$\"
            )\"
            c=\"100\"
            if [[ -z \$no_batt ]]; then
                c=\"\$(acpi -b | grep -oPs \"[0-9]+(?=%)\")\"
            fi
        elif [[ -n \$(command -v pmset) ]]; then
            c=\"\$(pmset -g batt | grep -oPs \"[0-9]+(?=%)\")\"
        fi

        if [[ -n \$c ]]; then
            [[ \$c -eq 100 ]] || ((\"c += 1\"))
            echo -n \"\$c% \"

            bsize=\"$(tlget -g @battery_bar_size)\"
            if [[ \$bsize -gt 0 ]]; then
                empty=\"$(tlget -g @battery_empty)\"
                filled=\"$(tlget -g @battery_filled)\"

                ((\"increment = 100 / bsize\"))
                ((\"round = increment / 2\"))
                ((\"c = (c + round) / increment\"))

                echo -n \"$(tlget -g @battery_bar_surround)\" | \
                    head -c 1
                if [[ -n \$(command -v acpi) ]]; then
                    chrg=\"\$(acpi -a 2>&1 | grep -s \"on-line\")\"
                    if [[ -n \$chrg ]] || [[ -n \$no_batt ]]; then
                        echo -n \"$(tlget -g @battery_charging)\"
                    fi
                fi
                for i in \$(seq 1 \$bsize); do
                    [[ \$i -gt \$c ]] || echo -n \"\$filled\"
                    [[ \$i -le \$c ]] || echo -n \"\$empty\"
                    if [[ \$i -ne \$bsize ]]; then
                        echo -n \"$(tlget -g @battery_bar_spacer)\"
                    fi
                done; unset i
                echo -n \"$(tlget -g @battery_bar_surround)\" | \
                    tail -c 1
                echo -n \" \"
            fi
        fi
    )"
fi
tmux set -ag status-right "%a %b %d, %Y %I:%M "
tmux set -g status-right-length "64"
# }}}

# {{{ Bindings
if [[ $(tget -g @prefix) != "C-b" ]]; then
    tmux unbind "C-b"
    tmux bind "$(tget -g @prefix)" send-prefix
fi
tmux bind "$(tget -g @prefix | awk -F "-" '{print $2}')" last-window

case "$(tget -g @default_ctrl_d)" in
    "on") tmux bind "C-d" detach-client ;;
    *)
        tmux bind -n "C-d" detach-client
        tmux bind "d" send -l ""
        ;;
esac
tmux bind "C-r" run "
    tmux source \"$HOME/.tmux.conf\"
    tmux display \"Done!\"
"
tmux bind "C-t" new-session

# Navigate panes and windows
tmux bind "h" select-pane -L
tmux bind "C-h" select-pane -L
tmux bind "j" select-pane -D
tmux bind "C-j" select-pane -D
tmux bind "k" select-pane -U
tmux bind "C-k" select-pane -U
tmux bind "l" select-pane -R
tmux bind "C-l" select-pane -R
tmux bind "C-n" next-window
tmux bind "C-p" previous-window

# Swap windows
tmux bind -r "<" swap-window -t -1
tmux bind -r ">" swap-window -t +1

# Resize panes
tmux bind -r "H" resize-pane -L "$(tget -g @resize)"
tmux bind -r "J" resize-pane -D "$(tget -g @resize)"
tmux bind -r "K" resize-pane -U "$(tget -g @resize)"
tmux bind -r "L" resize-pane -R "$(tget -g @resize)"

# Rotate windows
tmux bind -r "r" rotate-window -D
tmux bind -r "R" rotate-window -U

# Better new pane/window bindings
tmux bind "|" split-window -c "#{pane_current_path}" -h
tmux bind "%" split-window -c "#{pane_current_path}" -h
tmux bind "-" split-window -c "#{pane_current_path}" -v
tmux bind "\"" split-window -c "#{pane_current_path}" -v
tmux bind "c" new-window -c "#{pane_current_path}"

# Set "d" to base64 the selection
tmux bind -T copy-mode-vi "d" send -X copy-pipe-and-cancel "
    cd $(tfstr "#{pane_current_path}")
    args=\"\$(xargs -I {} echo \"{}\")\"
    echo \"\$args\" | base64 -d; echo
    tmux display \"\$(
        echo \"\$args\" | base64 -d | sed \"s/\#/\#\#/g\"
    )\"
"

# Set "v" to begin selection as in Vim
tmux bind -T copy-mode-vi "v" send -X begin-selection

# Other useful copy-mode-vi bindings
tmux bind -T copy-mode-vi "BSpace" send -X halfpage-up
tmux bind -T copy-mode-vi "Space" send -X halfpage-down

# Open files from copy-mode (will not work with filenames with spaces)
tmux bind -T copy-mode-vi "M-o" send -X copy-pipe-and-cancel "
    cd $(tfstr "#{pane_current_path}")
    args=\"\$(xargs -I {} echo \"{}\")\"
    set -- \$args
    [[ \$# -ne 0 ]] || exit 0
    if [[ -f \"\$1\" ]]; then
        type=\"\$(xdg-mime query filetype \$1)\"
    elif [[ -n \$(echo \"\$1\" | grep -Ps \"https?:\/\/\") ]]; then
        type=\"text/html\"
    fi
    [[ -n \$type ]] || exit 1
    exe=\"\$(xdg-mime query default \$type | sed \"s/.desktop//g\")\"
    [[ -n \$exe ]] || exit 2
    \$exe \$args
"
tmux bind -T copy-mode-vi "C-o" send -X copy-pipe-and-cancel "
    cd $(tfstr "#{pane_current_path}")
    args=\"\$(xargs -I {} echo \"{}\")\"
    tmux send \"C-c\"
    tmux send -l \"\\\${EDITOR:-vi} -- \$args\"
    tmux send \"C-m\"
"
tmux bind -T copy-mode-vi "M-O" send -X copy-pipe-and-cancel "
    cd $(tfstr "#{pane_current_path}")
    args=\"\$(xargs -I {} echo \"{}\")\"
    [[ -n \$(command -v gvim) ]] || exit 1
    gvim -- \$args
"

# Copy and paste (Linux only)
case "$(uname -s)" in
    "Darwin")
        tmux bind -T copy-mode-vi "y" send -X copy-pipe-and-cancel \
            "pbcopy"
        tmux bind -T copy-mode-vi MouseDragEnd1Pane send -X \
            copy-pipe-and-cancel "pbcopy"
        ;;
    "Linux")
        if [[ -n $(command -v xsel) ]]; then
            copy="xsel -b -i"
            paste="xsel -b -o"
        elif [[ -n $(command -v xclip) ]]; then
            copy="xclip -i -selection clipboard"
            paste="xclip -o -selection clipboard"
        fi
        if [[ -n $copy ]] && [[ -n $paste ]]; then
            tmux bind -T copy-mode-vi "y" send -X \
                copy-pipe-and-cancel "$copy"
            tmux bind -T copy-mode-vi MouseDragEnd1Pane send -X \
                copy-pipe-and-cancel "$copy"
            tmux bind "C-v" run \
                "$paste | tmux load-buffer -; tmux paste-buffer"
        fi
        ;;
esac

# Logging
tmux bind "P" run "
    file=\"$(tfget -g @log_path)/$(tfget -g @log_name)\"
    case \"$(uname -s)\" in
        \"Darwin\") tmp=\"\$(tmux capturep -J -p)\" ;;
        \"Linux\")
            tmp=\"\$(tmux capturep -J -p | sed -r \"s/\s+$//\")\"
            ;;
    esac
    printf \"%s\n\" \"\$tmp\" >\$file
    tmux display \"Successfully logged screenshot to \$file\"
"
tmux bind "S" run "
    file=\"$(tfget -g @log_path)/$(tfget -g @log_name)\"
    case \"$(uname -s)\" in
        \"Darwin\")
            tmp=\"\$(
                tmux capturep -J -p -S \"-$(tget -g history-limit)\"
            )\"
            ;;
        \"Linux\")
            tmp=\"\$(
                tmux capturep -J -p -S \"-$(tget -g history-limit)\" |
                sed -r \"s/\s+$//\"
            )\"
            ;;
    esac
    printf \"%s\n\" \"\$tmp\" >\$file
    tmux display \"Successfully logged all history to \$file\"
"

# Searching
tmux bind "/" run "
    tmux copy-mode
    tmux command-prompt -p \"(search up)\" \
        \"send -X search-backward '%%%'\"
"

# Tile layout
tmux bind "+" select-layout tiled

# Send to all panes
tmux bind "=" set -w synchronize-panes
# }}}

# {{{ Local file
for file in $HOME/.tmux/tmux.local $HOME/.tmux.local; do
    [[ ! -f "$file" ]] || tmux source "$file"
done; unset file
# }}}
