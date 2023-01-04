#!/usr/bin/env bash

# BLUE1="#fabada"
BLUE1="#7aa2f7"
BLUE2="#a9b1d6"
DARK1="#3b4281"
DARK2="#1f2335"
DARK3="#15161e"

setw -g clock-mode-colour "${BLUE1}"
set -g mode-style "fg=${BLUE1},bg=${DARK1}"

set -g message-style "fg=${BLUE1},bg=${DARK1}"
set -g message-command-style "fg=${BLUE1},bg=${DARK1}"

set -g pane-border-style "fg=${DARK1}"
set -g pane-active-border-style "fg=${BLUE1}"

set -g status "on"
set -g status-justify "centre"

set -g status-style "fg=${BLUE1},bg=${DARK2}"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=${DARK3},bg=${BLUE1},bold] #S "
set -g status-right "#[fg=${DARK3},bg=${BLUE1},bold] #h "

setw -g window-status-activity-style "underscore,fg=${BLUE2},bg=${DARK2}"
setw -g window-status-style "NONE,fg=${BLUE2},bg=${DARK2}"
setw -g window-status-separator " "
setw -g window-status-format "#[default] #I > #W "
setw -g window-status-current-format "#[fg=${BLUE1},bg=${DARK1},bold] #I > #W "

