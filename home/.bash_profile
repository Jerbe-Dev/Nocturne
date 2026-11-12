# Force NumLock OFF on this TTY before starting the desktop.
if [[ "$(tty 2>/dev/null)" =~ ^/dev/tty[0-9]+$ ]] && command -v setleds >/dev/null 2>&1; then
    setleds -D -num >/dev/null 2>&1 || true
fi

# Start Nocturne automatically after login on a local TTY.
if [[ -t 0 ]] &&
   [[ "$(tty 2>/dev/null)" =~ ^/dev/tty[123]$ ]] &&
   [[ -z "${WAYLAND_DISPLAY:-}" ]] &&
   command -v uwsm >/dev/null 2>&1; then
    if uwsm check may-start 2>/dev/null; then
        exec uwsm start -- niri
    fi
fi
