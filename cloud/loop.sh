#!/bin/sh -x
DIR="$1"
while true
do
	mkdir -p "$DIR"
	sh listen.sh "$DIR"
done
