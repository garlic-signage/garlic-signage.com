#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

rm $LINK_PATH/latest_linux_x64_player.AppImage
TARGET=`ls -rt $LINK_PATH/garlic-player_linux/garlic-player-linux-x64*AppImage | tail -n1`
ln -s $TARGET $LINK_PATH/latest_linux_x64_player.AppImage

