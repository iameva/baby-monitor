#!/bin/sh
ffmpeg -re \
  -f video4linux2 -framerate 30 -video_size 640x480 -i /dev/video0 \
  -f alsa -ac 2 -i hw:1 \
  -f mpegts udp://localhost:2021

