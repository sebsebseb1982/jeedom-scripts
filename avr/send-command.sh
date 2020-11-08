#!/bin/bash

COMMAND=$1
HOSTNAME=$2

curl "http://${HOSTNAME}/MainZone/index.put.asp" \
    --data-raw 'cmd1=aspMainZone_WebUpdateStatus%2F' \
    --data-urlencode "cmd0=$COMMAND"