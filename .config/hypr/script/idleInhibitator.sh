#! /usr/bin/env sh

SERVICE_NAME=hypridle.service

logger "Starting idle Inhibitor script"

if systemctl --user is-active --quiet "$SERVICE_NAME"; then
    logger "Stopping hypridle"
    notify-send "Stoped hypridle"
    systemctl --user stop "$SERVICE_NAME"
else
    logger "Started hypridle"
    notify-send "Started hypridle"
    systemctl --user start "$SERVICE_NAME"
fi


