#!/bin/sh

LINK_PATH="/home/niko/downloads/ci-builds"

rm $LINK_PATH/latest_macosx_player.dmg

ln -s $LINK_PATH/garlic-player_macosx/`ls -rt $LINK_PATH/garlic-player_macosx/ | tail -n1` $LINK_PATH/latest_macosx_player.dmg
