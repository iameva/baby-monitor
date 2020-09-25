#!/bin/sh

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

ln -s "$DIR/monitor-server.service" /etc/systemd/system/monitor-server.service 
ln -s "$DIR/monitor-server.nginx.conf" /etc/nginx/conf.d/monitor-server.nginx.conf

