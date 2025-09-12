#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

rm $LINK_PATH/latest_windows_creator.exe
TARGET=`ls -rt $LINK_PATH/garlic-creator_windows/*exe | tail -n1`
ln -s $TARGET $LINK_PATH/latest_windows_creator.exe

rm $LINK_PATH/latest_windows_creator.7z
TARGET=`ls -rt $LINK_PATH/garlic-creator_windows/*z | tail -n1`
ln -s $TARGET $LINK_PATH/latest_windows_creator.7z
