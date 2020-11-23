#!/bin/bash

TITLE=$1
MESSAGE=$2
PRIORITY=$3
RETRY=$4
EXPIRE=$5

wget https://api.pushover.net/1/messages.json \
    --post-data="token=$APP_TOKEN&user=$USER_TOKEN&message=$MESSAGE&title=$TITLE&priority=$PRIORITY&retry=$RETRY&expire=$EXPIRE" \
    -qO- > /dev/null 2>&1 &
