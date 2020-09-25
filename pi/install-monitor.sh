#!/bin/sh

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

ln -s "$DIR/monitor.service" /etc/systemd/system/monitor.service 

