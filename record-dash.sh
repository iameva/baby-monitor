#!/bin/bash
ffmpeg \
  -f video4linux2 -framerate 30 -video_size 640x480 -i /dev/video0 \
  -f alsa -ac 2 -i hw:1 \
  -c:a aac -b:a 32k -ac 1 \
  -c:v libx264 -profile:v baseline \
  -analyzeduration 0 \
  -probesize  10240 \
  -level 3.0 -pix_fmt yuv420p \
  -streaming 1 \
  -index_correction 1 \
  -crf 23 -preset veryfast -g 30 -sc_threshold 0 \
  -use_template 1 \
  -seg_duration 1 \
  -hls_playlist 1 \
  -master_pl_name stream.m3u8 \
  -master_m3u8_publish_rate 1 \
  -f dash \
  /www/monitor/video/stream.mpd

