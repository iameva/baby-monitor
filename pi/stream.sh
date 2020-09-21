#!/bin/sh
ffmpeg \
  -f video4linux2 -framerate 30 -video_size 640x480 -i /dev/video0 \
  -f alsa -ac 1 -i hw:2 \
  -c:a aac -b:a 24k -ac 1 \
  -c:v libx264 \
  -crf 25 -preset veryfast -g 30 -sc_threshold 0 \
  -f flv \
  rtmp://localhost:2021/live/app

