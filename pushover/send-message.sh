#!/bin/bash

APP_TOKEN=
USER_TOKEN=
TITLE=$1
MESSAGE=$2
PRIORITY=$3

wget https://api.pushover.net/1/messages.json \
    --post-data="token=$APP_TOKEN&user=$USER_TOKEN&message=$MESSAGE&title=$TITLE&priority=$PRIORITY" \
    -qO- > /dev/null 2>&1 &