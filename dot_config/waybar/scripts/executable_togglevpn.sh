#!/usr/bin/env bash

SERVICE="sing-box"

if systemctl is-active --quiet "$SERVICE"; then
  sudo systemctl stop "$SERVICE"
else
  sudo systemctl start "$SERVICE"
fi
