#!/bin/sh -x

trap "exit" INT TERM 
trap "kill $(jobs -p)" EXIT

echo "Forwarding..."

echo "$(pwd)"

while true
do
      sh forward.sh.cloud &
      sh forward.sh.architect &
      sh stream.sh

      echo "Stream exited"
      kill $(jobs -p)
      sleep 1
done

echo 'Finished!'
