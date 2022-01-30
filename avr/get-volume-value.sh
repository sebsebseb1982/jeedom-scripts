#!/bin/bash

avrHostName=$1

status=$(curl -s "http://${avrHostName}/goform/formMainZone_MainZoneXml.xml")

regex='<MasterVolume><value>(.*)</value></MasterVolume>'

[[ $status =~ $regex ]]

echo ${BASH_REMATCH[1]}