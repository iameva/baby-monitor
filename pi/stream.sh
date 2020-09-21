#!/bin/sh
ffmpeg \
  -f video4linux2 -framerate 25 -video_size 640x360 -i /dev/video0 \
  -f alsa -ac 1 -i 'default:CARD=U20' \
  -c:a aac -b:a 64k -ac 1 \
  -c:v libx264 \
  -crf 17 -preset veryfast -g 30 -sc_threshold 0 \
  -f flv \
  rtmp://localhost:2021/live/app

