#!/bin/sh
ffmpeg \
  -f video4linux2 -framerate 30 -video_size 640x480 -i /dev/video0 \
  -f alsa -ac 1 -i "sysdefault:CARD=U20" \
  -c:v libx264 \
  -f mpeg \
  test.mp4

