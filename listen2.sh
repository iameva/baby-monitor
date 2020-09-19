#!/bin/sh
ffmpeg \
  -f flv -listen 1 -i rtmp://localhost:2021/live/app \
  -c:a aac -b:a 24k -ac 1 \
  -c:v libx264 -profile:v baseline \
  -level 3.0 -pix_fmt yuv420p \
  -f segment -segment_time 5 -segment_format mp4 "videos/out%03d.mp4"
