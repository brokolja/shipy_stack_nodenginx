#!/bin/bash
set -euo pipefail

if [ "$(id -u)" = '0' ]; then
  user='node'
  group='node'
else
  user="$(id -u)"
  group="$(id -g)"
fi

chown -fR "$user:$group" /usr/src/app || true

chmod -fR 0770 /usr/src/app || true

exec gosu "$user" "$@"