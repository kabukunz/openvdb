#! /bin/bash

source $SETUP_BASE/buildscripts/setup.sh

# prepare tmp dir
rm -rf $OPENVDB_MODULES
mkdir $OPENVDB_MODULES

# copy original libs
cp $OPENVDBDIR/libopenvdb.5.1.0.dylib $OPENVDB_MODULES
cp $OPENVDBDIR/pyopenvdb.so $OPENVDB_MODULES

# pack with dyblibbundler
# must be used within directory
cd $OPENVDB_MODULES

# dylib relocation for libopenvdb
dylibbundler -of -b -x libopenvdb.5.1.0.dylib -d $OPENVDB_MODULES -p @loader_path

# relink pyopenvdb
dylibbundler -of -b -x pyopenvdb.so -d $OPENVDB_MODULES -p @loader_path