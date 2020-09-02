#!/bin/bash
ffmpeg -re \
  -f alsa -itsoffset -0.5 -ac 2 -i hw:1 \
  -f video4linux2 -framerate 30 -video_size 640x480 -i /dev/video0 \
  -c:a aac -b:a 64k -ac 1 \
  -c:v libx264 \
  -movflags +faststart \
  -crf 30 -preset veryfast -g 30 -sc_threshold 0 \
  -f hls -hls_time 1 \
  -hls_flags independent_segments \
  -hls_list_size 0 \
  -hls_allow_cache 0 \
  -hls_segment_type mpegts \
  -streaming true \
  -hls_playlist_type event \
  /www/monitor/video/stream.m3u8

