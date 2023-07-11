#!/bin/bash

# inputs
#SUBTITLE_FILE
#VIDEO_FILE

FONT_SIZE="${FONT_SIZE:-24}"
if ! [ -x "$(command -v ffmpeg)" ]; then
  echo "ffmpeg is not installed, installing now ..." >&2
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install ffmpeg
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ffmpeg
    fi
  exit 1
else
    echo "ffmpeg is already installed, rendering subtitles ..."
    echo "video file = $VIDEO_FILE using font size $FONT_SIZE and font file '$SUBTITLE_FILE'"
    ffmpeg -i $VIDEO_FILE -vf "subtitles=$SUBTITLE_FILE:force_style='Fontsize=$FONT_SIZE,PrimaryColour=&H0000ff&'" -c:a copy output.mp4
fi
