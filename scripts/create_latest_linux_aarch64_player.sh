#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

rm $LINK_PATH/latest_linux_aarch64_player.AppImage
TARGET=`ls -rt $LINK_PATH/garlic-player_linux/garlic-player-linux-aarch64*AppImage | tail -n1`
ln -s $TARGET $LINK_PATH/latest_linux_aarch64_player.AppImage

