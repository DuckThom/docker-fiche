#!/bin/sh

local domain=${$FICHE_DOMAIN:-'http://localhost/'}
local port=${$FICHE_PORT:-9999}
local basedir=${$FICHE_BASEDIR:-'/app/uploads/'}

/app/fiche -d "$domain" -p "$port" -o "$basedir"
