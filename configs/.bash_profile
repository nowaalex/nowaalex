if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
 	exec sway
	eval `ssh-agent`

	# for screen sharing in chrome
	export XDG_CURRENT_DESKTOP=sway # xdg-desktop-portal
	export XDG_SESSION_DESKTOP=sway # systemd
	export XDG_SESSION_TYPE=wayland # xdg/systemd

	if [ -f /etc/bash_completion ]; then
   		. /etc/bash_completion
	fi
fi
