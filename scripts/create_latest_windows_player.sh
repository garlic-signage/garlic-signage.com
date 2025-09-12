#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

rm $LINK_PATH/latest_windows_player.exe
TARGET=`ls -rt $LINK_PATH/garlic-player_windows/*exe | tail -n1`
ln -s $TARGET $LINK_PATH/latest_windows_player.exe

rm $LINK_PATH/latest_windows_player.7z
TARGET=`ls -rt $LINK_PATH/garlic-player_windows/*z | tail -n1`
ln -s $TARGET $LINK_PATH/latest_windows_player.7z
