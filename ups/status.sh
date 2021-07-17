#!/bin/bash
SYNOLOGY_HOST=192.168.1.169
SYNOLOGY_PORT=5000

LOGIN=$1
PASSWORD=$2

AUTH_PATH=$(curl \
    --location \
    -s \
    --request GET "$SYNOLOGY_HOST:$SYNOLOGY_PORT/webapi/query.cgi?api=SYNO.API.Info&method=Query&version=1&query=SYNO.API.Auth" | jq --raw-output '.data["SYNO.API.Auth"].path')

#echo "AUTH_PATH=$AUTH_PATH"

SID=$(curl \
    --location \
    -s \
    --request GET "$SYNOLOGY_HOST:$SYNOLOGY_PORT/webapi/$AUTH_PATH?api=SYNO.API.Auth&method=Login&version=2&account=$LOGIN&passwd=$PASSWORD&session=SurveillanceStation&format=sid" | jq --raw-output '.data.sid')

#echo "SID=$SID"

UPS_PATH=$(curl \
    --location \
    -s \
    --request GET "$SYNOLOGY_HOST:$SYNOLOGY_PORT/webapi/query.cgi?api=SYNO.API.Info&method=Query&version=1&query=SYNO.Core.ExternalDevice.UPS" | jq --raw-output '.data["SYNO.Core.ExternalDevice.UPS"].path')

#echo "UPS_PATH=$UPS_PATH"

curl \
    --location \
    -s \
    --request GET "$SYNOLOGY_HOST:$SYNOLOGY_PORT/webapi/$UPS_PATH?api=SYNO.Core.ExternalDevice.UPS&method=get&version=1&_sid=$SID" | jq '.data'

curl \
    --location \
    -s \
    --request GET "$SYNOLOGY_HOST:$SYNOLOGY_PORT/webapi/$AUTH_PATH?api=SYNO.API.Auth&method=Logout&version=2&session=SurveillanceStation&_sid=$SID"