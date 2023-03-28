#!/usr/bin/env bash

# tokyonight
#LIGHT1="#7aa2f7"
#LIGHT2="#a9b1d6"
#DARK1="#3b4281"
#DARK2="#1f2335"
#DARK3="#15161e"

# everforest
LIGHT1="#ffffff"
LIGHT2="#c4c5b5"
DARK1="#000000"
DARK2="#1a1a1a"
DARK3="#625e4c"

setw -g clock-mode-colour "${LIGHT1}"
set -g mode-style "fg=${LIGHT1},bg=${DARK1}"

set -g message-style "fg=${LIGHT1},bg=${DARK1}"
set -g message-command-style "fg=${LIGHT1},bg=${DARK1}"

set -g pane-border-style "fg=${DARK1}"
set -g pane-active-border-style "fg=${LIGHT1}"

set -g status "on"
set -g status-justify "centre"

set -g status-style "fg=${LIGHT1},bg=${DARK2}"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=${DARK3},bg=${LIGHT1},bold] #S "
set -g status-right "#[fg=${DARK3},bg=${LIGHT1},bold] #h "

setw -g window-status-activity-style "underscore,fg=${LIGHT2},bg=${DARK2}"
setw -g window-status-style "NONE,fg=${LIGHT2},bg=${DARK2}"
setw -g window-status-separator " "
setw -g window-status-format "#[default] #I > #W "
setw -g window-status-current-format "#[fg=${LIGHT1},bg=${DARK1},bold] #I > #W "

