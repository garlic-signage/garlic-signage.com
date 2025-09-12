#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

if [ -f $LINK_PATH/latest_raspberrypi64.img.xz ]; then
  rm $LINK_PATH/latest_raspberrypi64.img.xz
fi

ln -s $LINK_PATH/garlic-player_rpi64/`ls -rt $LINK_PATH/garlic-player_rpi64/ | tail -n1` $LINK_PATH/latest_raspberrypi64.img.xz
