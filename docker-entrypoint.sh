#!/bin/sh
set -eu

CONFIG_FILE=${SUBWEB_CONFIG_FILE:-/usr/share/nginx/html/config.js}

js_escape() {
  printf '%s' "$1" | sed "s/\\\\/\\\\\\\\/g; s/'/\\\\'/g"
}

cat > "$CONFIG_FILE" <<EOF
window.SUBWEB_CONFIG = {
  title: '$(js_escape "${SUBWEB_TITLE:-}")',
  defaultBackend: '$(js_escape "${SUBWEB_DEFAULT_BACKEND:-}")'
};
EOF

exec "$@"
