#!/bin/bash

SENSOR_PATH=$1

while [ "$CRC" != "YES" ]; do
    RAW_VALUE=$(cat $SENSOR_PATH)
    CRC=$(echo $RAW_VALUE | head -n 1)
    CRC=${CRC:36:3}
    #echo "CRC=${CRC}"
done

TEMPERATURE=$(echo -e "$RAW_VALUE" | sed '2q;d')
TEMPERATURE=${TEMPERATURE:29:2}.${TEMPERATURE:31:3}
#echo "TEMPERATURE=${TEMPERATURE}°C"
echo ${TEMPERATURE}
