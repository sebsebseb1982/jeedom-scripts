#!/bin/bash

curl \
    --location \
    --request GET "http://$HOST_JEEDOM/core/api/jeeApi.php?plugin=virtual&apikey=$API_KEY&type=virtual&id=$1&value=$2"