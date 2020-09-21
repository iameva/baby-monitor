#!/bin/sh
echo "$(openssl rand -hex 18)-$1"
