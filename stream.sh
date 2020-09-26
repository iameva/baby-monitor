#!/bin/sh
ffmpeg \
  -f video4linux2 -framerate 30 -video_size 640x480 -i /dev/video2 \
  -f alsa -ac 1 -i default \
  -c:v libx264 \
  -crf 25 -preset veryfast -g 30 -sc_threshold 0 \
  -f flv \
  tcp://localhost:2021

