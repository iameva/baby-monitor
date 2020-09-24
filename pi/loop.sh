#!/bin/sh -x

trap "exit" INT TERM 

sh "forward.sh.cloud" &

sh "forward.sh.architect" &

trap "kill 0" EXIT

echo "Forwarding..."

echo "$(pwd)"

while true
do
      sh "stream.sh"

      echo "Stream exited"
      sleep 1
done

echo 'Finished!'
