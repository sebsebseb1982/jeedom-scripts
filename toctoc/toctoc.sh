#!/bin/bash

cd ~/git/domotic3

if node src/alarm/alarm.js | grep -q 'true'; then
   echo "1"
else
   echo "0"
fi