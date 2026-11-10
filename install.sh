#!/usr/bin/env bash
set -euo pipefail


sudo apt-get update
sudo apt-get install -y tmux

mkdir -p ~/.config/systemd/user
cp claude-telegram.service claude-telegram-restart.service claude-telegram-restart.timer ~/.config/systemd/user/

systemctl --user daemon-reload
systemctl --user enable --now claude-telegram.service claude-telegram-restart.timer

# Optional: keep user services running without a login (and start them at boot).
# sudo loginctl enable-linger "$USER"
