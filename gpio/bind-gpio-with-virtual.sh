#!/bin/bash
GPIO=$1
virtualId=$2
gpio mode $GPIO in

previousState=0

while true; do
  if [ 1 == "$(gpio read ${GPIO})" ]; then
    printf "high \r"
    newState=1
  else
    printf "low  \r"
    newState=0
  fi

  if [ "$newState" != "$previousState" ]; then
    sh ./../virtual/update.sh $virtualId $newState
  fi

  previousState=$newState

  sleep 0.2
done
