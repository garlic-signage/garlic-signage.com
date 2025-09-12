#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

if [ -f $LINK_PATH/latest_windows_player.exe ]; then
  rm $LINK_PATH/latest_windows_player.exe
 fi

TARGET=`ls -rt $LINK_PATH/garlic-player_windows/*exe | tail -n1`
ln -s $TARGET $LINK_PATH/latest_windows_player.exe

if [ -f $LINK_PATH/latest_windows_player.7z ]; then
  rm $LINK_PATH/latest_windows_player.7z
fi

TARGET=`ls -rt $LINK_PATH/garlic-player_windows/*z | tail -n1`
ln -s $TARGET $LINK_PATH/latest_windows_player.7z
