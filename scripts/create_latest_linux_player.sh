#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

if [ -f $LINK_PATH/latest_linux_x64_player.AppImage ]; then
  rm $LINK_PATH/latest_linux_x64_player.AppImage
fi

TARGET=`ls -rt $LINK_PATH/garlic-player_linux/garlic-player-linux-x64*AppImage | tail -n1`
ln -s $TARGET $LINK_PATH/latest_linux_x64_player.AppImage

