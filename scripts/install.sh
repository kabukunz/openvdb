#! /bin/bash

source $SETUP_BASE/openvdb/setup.sh

# install

cp -R $OPENVDB_ADDON $BLENDER_TARGET/blender.app/Contents/Resources/$BLENDER_VERSION/scripts/addons
