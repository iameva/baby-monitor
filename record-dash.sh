#!/bin/bash
ffmpeg \
  -f video4linux2 -framerate 30 -video_size 640x480 -i /dev/video0 \
  -f alsa -ac 2 -i hw:1 \
  -c:a aac -b:a 24k -ac 1 \
  -c:v libx264 -profile:v baseline \
  -analyzeduration 0 \
  -probesize 32 \
  -level 3.0 -pix_fmt yuv420p \
  -crf 23 -preset veryfast -g 30 -sc_threshold 0 \
  -use_template 1 \
  -seg_duration 1 \
  -frag_duration 1 \
  -movflags faststart \
  -streaming 1 \
  -master_pl_name stream.m3u8 \
  -hls_playlist 1 \
  -master_m3u8_publish_rate 1 \
  -f dash \
  /www/monitor/video/stream.mpd

#ffmpeg -re \
#  -f alsa -ac 2 -i hw:1 \
#  -f video4linux2 -framerate 30 -video_size 600x480 -i /dev/video0 \
#  -c:a libvorbis -b:a 128k -ac 1 \
#  -f dash -seg_duration 2 -frag_duration 1 \
#  -hls_playlist true \
#  -dash_segment_type webm \
#  -c:v libvpx-vp9 -crf 30 -preset veryfast -g 30 -sc_threshold 0 \
#  /www/thoughts/video/stream.mpd

