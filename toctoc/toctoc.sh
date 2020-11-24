#!/bin/bash

username=$1
password=$2

curl -u $username:$password --silent "https://mail.google.com/mail/feed/atom/Alarme" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d' | while read arg1; do
   REGEX="([a-zA-Z]+)rming.*"
   if [[ $arg1 =~ $REGEX ]]
   then
      if [ "${BASH_REMATCH[1]}" = "A" ]
      then
         echo "0"
      else
         echo "1"
      fi
   fi
done
