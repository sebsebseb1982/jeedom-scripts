#!/bin/sh

echo $JEEDOM_HOST

echo "http://${JEEDOM_HOST}/core/api/jeeApi.php?plugin=virtual&apikey=${JEEDOM_API_KEY}&type=virtual&id=$1&value=$2"

curl --location --request GET "http://${JEEDOM_HOST}/core/api/jeeApi.php?plugin=virtual&apikey=${JEEDOM_API_KEY}&type=virtual&id=$1&value=$2"
