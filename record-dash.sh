#!/bin/bash
ffmpeg \
  -f video4linux2 -framerate 25 -i /dev/video2 \
  -f alsa -ac 1 -i hw:2 \
  -c:v libx264 -profile:v baseline \
  -level 3.0 -pix_fmt yuv420p \
  -crf 23 -preset veryfast -g 25 -sc_threshold 0 \
  -seg_duration 1 \
  -hls_playlist 1 \
  -master_pl_name stream.m3u8 \
  -master_m3u8_publish_rate 1 \
  -f dash \
  /www/monitor/video/stream.mpd

