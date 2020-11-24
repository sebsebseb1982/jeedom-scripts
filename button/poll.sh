#!/bin/bash
# return GPIO input status

# select pin
GPIO=$1

# prepare the pin
if [ ! -d /sys/class/gpio/gpio${GPIO} ]; then
  echo "${GPIO}" > /sys/class/gpio/export
fi
echo "in" > /sys/class/gpio/gpio"${GPIO}"/direction

# continuously monitor current value
while true; do
  if [ 1 == "$(</sys/class/gpio/gpio"${GPIO}"/value)" ]; then
    printf "high \r"
  else
    printf "low  \r"
  fi
done
