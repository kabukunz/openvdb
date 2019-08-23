#! /bin/bash

source $SETUP_BASE/buildscripts/setup.sh

# install

cp -R $OPENVDB_ADDON $BLENDER_TARGET/blender.app/Contents/Resources/$BLENDER_VERSION/scripts/addons
