#!/bin/bash

SENSOR_PATH=$1
RETRY=0

while [ "$CRC" != "YES" ]; do
    RAW_VALUE=$(cat $SENSOR_PATH)
    CRC=$(echo $RAW_VALUE | head -n 1)
    CRC=${CRC:36:3}
    #echo "CRC=${CRC}"

    let "RETRY+=1"
    if [ $RETRY -ge 100 ] 
    then
        echo "Impossible de lire une température sur la sonde $SENSOR_PATH."
        exit 1
    fi
done

TEMPERATURE=$(echo -e "$RAW_VALUE" | sed '2q;d')
TEMPERATURE=${TEMPERATURE:29:2}.${TEMPERATURE:31:3}
#echo "TEMPERATURE=${TEMPERATURE}°C"
echo ${TEMPERATURE}