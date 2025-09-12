#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

if [ -f "$LINK_PATH/latest_android_launcher.apk" ]; then
  rm $LINK_PATH/latest_android_launcher.apk
fi

ln -s $LINK_PATH/garlic-launcher/`ls -rt $LINK_PATH/garlic-launcher/ | tail -n1` $LINK_PATH/latest_android_launcher.apk

CHECKSUM=`cat $LINK_PATH/latest_android_launcher.apk | openssl dgst -binary -sha256 | openssl base64 | tr '+/' '-_' | tr -d '='`

echo $CHECKSUM > $LINK_PATH/latest_android_launcher.chksum

# 
