#!/bin/sh -x
ROOT="$1"
while true
do
	DATE="$(date '+%Y-%m-%d_%H:%M:%S')"
	DIR="$ROOT/$DATE"
	mkdir -p "$DIR"
	rm "$ROOT/live"
	ln -s "$DIR/" "$ROOT/live"
	sh listen.sh "$DIR"
done
