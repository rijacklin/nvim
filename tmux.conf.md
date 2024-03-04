# remap prefix from 'C-b' to 'C-f'

unbind-key C-b
set-option -g prefix C-f
bind-key C-f send-prefix

# start with window 1 (instead of 0)

set -g base-index 1

# start with pane 1

set -g pane-base-index 1

# source config file

# bind r source-file ~/.tmux.conf

# allow terminal scrolling

# set-option -g terminal-overrides 'xterm\*:smcup@:rmcup@'

# use vi mode

setw -g mode-keys vi
set -g status-keys vi

# split panes using 'v' and 's'

bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# moving between panes with vim movement keys

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# resize the pane

bind-key -r J resize-pane -D 3
bind-key -r K resize-pane -U 3
bind-key -r H resize-pane -L 3
bind-key -r L resize-pane -R 3

set -g status-style bg="#91b4f4"
set -ga status-style fg="#000000"

# Pane border styles

set -g pane-border-style fg="#91b4f4"
set -g pane-active-border-style "bg=default fg=#91b4f4"

# 12-hour clock

set -g status-right "#[fg=#000000]%A, %d %b %Y %I:%M %p"

# List of plugins

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)

run '~/.tmux/plugins/tpm/tpm'
