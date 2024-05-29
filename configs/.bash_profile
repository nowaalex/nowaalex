if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
  eval `ssh-agent`
  if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi
