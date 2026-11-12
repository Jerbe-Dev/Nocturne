if status is-interactive
    set fish_greeting
end

# Start Nocturne automatically after a real TTY login (no display manager).
# Only use the first three virtual terminals; never launch inside Kitty.
if status is-login
    and status is-interactive
    and isatty stdin
    and string match -rq '^/dev/tty[123]$' (tty)
    and not set -q WAYLAND_DISPLAY
    and type -q uwsm
    and uwsm check may-start >/dev/null 2>&1
    exec uwsm start -- niri
end

starship init fish | source
