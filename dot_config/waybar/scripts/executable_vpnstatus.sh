#!/usr/bin/env bash

if systemctl is-active --quiet sing-box; then
  echo '{"text":"󰒘","class":"vpn-on","tooltip":"VPN: ON"}'
else
  echo '{"text":"󰒙","class":"vpn-off","tooltip":"VPN: OFF"}'
fi

