#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

if [ -f $LINK_PATH/latest_windows_creator.exe ]; then
  rm $LINK_PATH/latest_windows_creator.exe
fi

TARGET=`ls -rt $LINK_PATH/garlic-creator_windows/*exe | tail -n1`
ln -s $TARGET $LINK_PATH/latest_windows_creator.exe

if [ -f $LINK_PATH/latest_windows_creator.7z ]; then
  rm $LINK_PATH/latest_windows_creator.7z
fi

TARGET=`ls -rt $LINK_PATH/garlic-creator_windows/*z | tail -n1`
ln -s $TARGET $LINK_PATH/latest_windows_creator.7z
