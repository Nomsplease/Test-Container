#!/bin/bash
set -x

RUN_FLUXBOX=${RUN_FLUXBOX:-yes}

case $RUN_FLUXBOX in
  false|no|n|0)
    rm -f /app/supervisor/conf.d/fluxbox.conf
    ;;
esac

# start supervisord
exec supervisord -c /app/supervisor/supervisord.conf