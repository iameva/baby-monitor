#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -s "$DIR/streamer.service" /etc/systemd/system/streamer.service 

