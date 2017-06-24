#!/bin/sh

dockerize -template /app/config.json.tmpl:/app/config.json
node /app/main.js $LASTFM_USER
