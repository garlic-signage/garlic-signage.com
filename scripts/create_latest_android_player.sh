#!/bin/bash

LINK_PATH="/home/niko/downloads/ci-builds"

# delete this later
if [ -f $LINK_PATH/latest_android_player.apk ]; then
  rm $LINK_PATH/latest_android_player.apk
fi

declare -a  ABIS=( multiabi x86_64 arm64-v8a armeabi-v7a x86 )

for ARCH in "${ABIS[@]}"
do
  if [ -f $LINK_PATH/latest_android_${ARCH}_player.apk ]; then
    rm $LINK_PATH/latest_android_${ARCH}_player.apk
  fi

  TARGET=`ls -rt $LINK_PATH/garlic-player_android/*${ARCH}* | tail -n1`
  ln -s $TARGET $LINK_PATH/latest_android_${ARCH}_player.apk
done
