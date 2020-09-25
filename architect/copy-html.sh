#!/bin/sh

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

cp "$DIR/www/"* /www
chown -R http:http /www

