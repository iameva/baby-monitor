#!/bin/bash
ffmpeg \
  -f alsa -itsoffset -0.5 -ac 2 -i hw:1 \
  -f video4linux2 -framerate 30 -video_size 640x480 -i /dev/video0 \
  -c:a aac -b:a 64k -ac 1 \
  -c:v libx264 \
  -crf 30 -preset veryfast -g 30 -sc_threshold 0 \
  -f dash -seg_duration 1 -frag_duration 1 \
  -dash_segment_type mp4 \
  -streaming 1 \
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

