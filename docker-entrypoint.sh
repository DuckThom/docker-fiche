#!/bin/sh

set -e

local domain
local port
local basedir
local user

if [ -n "$FICHE_DOMAIN" ]; then
    domain="$FICHE_DOMAIN"
else
    domain="http://localhost/"
fi

if [ -n "$FICHE_PORT" ]; then
    port="$FICHE_PORT"
else
    port="9999"
fi

if [ -n "$FICHE_BASEDIR" ]; then
    basedir="$FICHE_BASEDIR"
else
    basedir="/app/uploads"
fi

if [ -n "$FICHE_USER" ]; then
    user="$FICHE_USER"
else
    user="root"
fi

/app/fiche \
    -d "$domain" \
    -p "$port" \
    -o "$basedir" \
    -u "$user"
