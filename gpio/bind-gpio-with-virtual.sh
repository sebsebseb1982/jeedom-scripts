#!/bin/bash
GPIO=$1
virtualId=$2
gpio mode $GPIO in

previousState=false

CURRENT_PATH="`dirname \"$0\"`"

while true; do
  if [ 1 == "$(gpio read ${GPIO})" ]; then
    printf "high \r"
    newState=true
  else
    printf "low  \r"
    newState=false
  fi

  if [ "$newState" != "$previousState" ]; then
    sh $CURRENT_PATH/../virtual/update.sh $virtualId $newState
  fi

  previousState=$newState

  sleep 0.2
done
