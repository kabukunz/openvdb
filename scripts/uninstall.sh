#! /bin/bash

source $SETUP_BASE/openvdb/setup.sh

# uninstall

rm -rf $BLENDER_TARGET/blender.app/Contents/Resources/$BLENDER_VERSION/scripts/addons/openvdb-remesh

# cd $BLENDER_TARGET/blender.app/Contents/Resources/$BLENDER_VERSION/scripts/addons/modules

# rm -rf libblosc.1.14.4.dylib
# rm -rf libboost_numpy3-clang-darwin42-mt-x64-1_66.dylib
# rm -rf libboost_iostreams-clang-darwin42-mt-x64-1_66.dylib
# rm -rf libboost_python3-clang-darwin42-mt-x64-1_66.dylib
# rm -rf libboost_system-clang-darwin42-mt-x64-1_66.dylib
# rm -rf libHalf.23.dylib
# rm -rf liblzma.5.dylib
# rm -rf libopenvdb.5.1.0.dylib
# rm -rf libtbb.dylib
# rm -rf pyopenvdb.so

# rm -rf $BLENDER_TARGET/blender.app/Contents/Resources/2.79/scripts/addons/vdb_remesh.py
# rm -rf $BLENDER_TARGET/blender.app/Contents/Resources/2.79/scripts/addons/vdb_surf.py
# rm -rf $BLENDER_TARGET/blender.app/Contents/Resources/2.79/scripts/addons/__init__.py
