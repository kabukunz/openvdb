#! /bin/bash

#
# building openvdb from source on Os X
#

#
# use the provided makefile. Using CMake gives out an error on GLFW which cannot be skipped,
# even if you disable the option it builds it the same
# so no fix short of changing the CMakefile.txt, not sane
# luckily there's a provided makefile which works
# 
# download latest openvdb 5+
# install all need libraries as shown in $OPENVDBDIR/INSTALL with Homebrew
# build boost from source (see build_boost.sh)
# good luck
#

# export OPENVDBDIR=/Users/max/Developer/Library/Blender/openvdbambi/openvdb 
# export OPENVDBLIB=$OPENVDBDIR/build/python/lib/python3.5

# # relocating broken links in libraries
# export LBS_IOSTREAM=libboost_iostreams-clang-darwin42-mt-x64-1_66.dylib
# export LBS_NUMPY=libboost_numpy3-clang-darwin42-mt-x64-1_66.dylib
# export LBS_PYTHON=libboost_python3-clang-darwin42-mt-x64-1_66.dylib
# export LBS_SYSTEM=libboost_system-clang-darwin42-mt-x64-1_66.dylib
# export LBS_THREAD=libboost_thread-clang-darwin42-mt-x64-1_66.dylib

# # boost libs
# export BOOSTDIR=/Users/max/Developer/Library/Build/boost_1_66_0
# export BOOSTLIB=$BOOSTDIR/release/lib

# # blender module dir
# export BLENDER_MODDIR=/Users/max/Developer/Library/Blender/blender-2.79a-RC/blender.app/Contents/Resources/2.79/scripts/addons/modules

# copy makefile
cp $SETUP_BASE/openvdb/Makefile $OPENVDBDIR/Makefile

# build openvdb
cd $OPENVDBDIR
make clean
make python
# make install

# fix pyopenvdb.so links IN $OPENVDBDIR/pyopenvdb.so
# cd $OPENVDBLIB
cd $OPENVDBDIR

# need XCode with command line tools for this
install_name_tool -change @rpath/$LBS_IOSTREAM $BOOSTLIB/$LBS_IOSTREAM pyopenvdb.so
install_name_tool -change @rpath/$LBS_NUMPY $BOOSTLIB/$LBS_NUMPY pyopenvdb.so
install_name_tool -change @rpath/$LBS_PYTHON $BOOSTLIB/$LBS_PYTHON pyopenvdb.so
install_name_tool -change @rpath/$LBS_SYSTEM $BOOSTLIB/$LBS_SYSTEM pyopenvdb.so
install_name_tool -change @rpath/$LBS_THREAD $BOOSTLIB/$LBS_THREAD pyopenvdb.so

# remove blosc r-path
install_name_tool -change @rpath/libblosc.1.dylib $BLOSCDIR/build/blosc/libblosc.1.14.4.dylib pyopenvdb.so

# point to openvdb library
install_name_tool -change libopenvdb.5.1.0.dylib $OPENVDBDIR/libopenvdb.5.1.0.dylib pyopenvdb.so

# cd $OPENVDBDIR

# remove blosc r-path from libopenvdb
install_name_tool -change @rpath/libblosc.1.dylib $BLOSCDIR/build/blosc/libblosc.1.14.4.dylib libopenvdb.5.1.0.dylib
