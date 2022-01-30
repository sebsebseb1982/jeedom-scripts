#!/bin/bash

itemName=$1
avrHostName=$2

status=$(curl -s "http://${avrHostName}/goform/formMainZone_MainZoneXml.xml")

regex="<$itemName><value>(.*)</value></$itemName>"

[[ $status =~ $regex ]]

echo ${BASH_REMATCH[1]}