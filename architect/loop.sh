#!/bin/sh -x
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT="$1"
while true
do
	DATE="$(date '+%Y-%m-%d_%H:%M:%S')"
	DIR="$ROOT/$DATE"
  VIDEO_DIR="$DIR/video"
	mkdir -p "$VIDEO_DIR"
	rm "$ROOT/live"
	ln -s "$DIR/" "$ROOT/live"
	sh "$SCRIPT_DIR/listen.sh" "$VIDEO_DIR"
done
