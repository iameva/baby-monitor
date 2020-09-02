#!/bin/bash
ffmpeg -re \
  -f flv -listen 1 -i rtmp://localhost:2021/live/app \
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

