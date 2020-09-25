#!/bin/sh
ffmpeg \
  -use_wallclock_as_timestamps 1 \
  -async 1 \
  -f video4linux2 -framerate 15 -video_size 640x360 -i /dev/video0 \
  -f alsa -ac 1 -i hw:1 \
  -map 0 \
  -c:a aac -b:a 64k -ac 1 \
  -c:v libx264 \
  -crf 20 -preset veryfast \
  -f tee "[f=flv]rtmp://localhost:2021/live/app|[f=flv]rtmp://localhost:2022/live/app"

