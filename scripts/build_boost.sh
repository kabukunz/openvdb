#! /bin/bash

# building boost from source on Os X, with boost.python and boost.numpy

#
# using boost with boost-python from brew results in loads of errors
# you need boost-python3 and that installs python forcefully, too
# upsetting python configuration
# 
# basicly you need a 3.5.3 python setup with numpy 1.11.2 installed
# without numpy the boost python numpy library won't build
#
# moreover, it looks like openvdb check for /usr/local boost even if you build one
# hence remove symlink in brew
#
# download latest boost (not previous versions!) and install it in BOOSTDIR
#

# export BOOSTDIR=/Users/max/Developer/Library/Build/boost_1_66_0
# export BOOSTLIB=$BOOSTDIR/release/lib
# export PYTHONDIR=/Users/max/.pyenv/versions/3.5.3

# need to have python on path
# source ./build_setup.sh

# Steps:

# first of all, brew unlink boost to disable any /usr/local installation
# brew unkink boost

# example
# ./b2 --prefix=/Users/max/Developer/Library/Build/boost_1_66_0/release \
# --build-dir=/Users/max/Developer/Library/Build/boost_1_66_0/build \
# --reconfigure \ recheck conf
# -q \ stop at error
# -a \ rebuild everythin

# # fix include dir for python, boost builder doesn't know
# ln -s $PYTHONDIR/include/python3.5m $PYTHONDIR/include/python3.5
# # fix for python library
# ln -s $PYTHONDIR/bin/python3.5m $PYTHONDIR/lib/libpython3.5.dylib

# boost libs used by openvdb
# boost_iostreams boost_system boost_thread boost_python3
# release mt static and shared are built by default on OS X

# create dirs for building and installing 
rm -rf $BOOSTDIR/build
rm -rf $BOOSTDIR/release
mkdir $BOOSTDIR/build
mkdir $BOOSTDIR/release

# change to boost dir
cd $BOOSTDIR

# b2 configure command (prepare boost compilation)
# ./b2 --configure

# build libraries (stage)
# ./b2 stage --build-dir=/Users/max/Developer/Library/Build/boost_1_66_0/build \
# --reconfigure -q -a \
# --with-iostreams --with-system --with-thread --with-python 

./b2 --clean

# install 
# ./b2 install --prefix=/Users/max/Developer/Library/Build/boost_1_66_0/release

# all together
./b2 toolset=clang cxxflags="-stdlib=libc++" linkflags="-stdlib=libc++" \
--build-dir=$BOOSTDIR/build \
--layout=versioned --reconfigure -q -a \
--with-iostreams --with-system --with-thread --with-python \
threading=multi stage \
--prefix=$BOOSTDIR/release \
install 

# fix boost libs
cd $BOOSTLIB
# fix internal reference among boost libraries
install_name_tool -change @rpath/$LBS_PYTHON $BOOSTLIB/$LBS_PYTHON $LBS_NUMPY
install_name_tool -change @rpath/$LBS_SYSTEM $BOOSTLIB/$LBS_SYSTEM $LBS_THREAD
# fix other rpaths
install_name_tool -id $BOOSTLIB/$LBS_IOSTREAM $LBS_IOSTREAM
install_name_tool -id $BOOSTLIB/$LBS_NUMPY $LBS_NUMPY
install_name_tool -id $BOOSTLIB/$LBS_PYTHON $LBS_PYTHON
install_name_tool -id $BOOSTLIB/$LBS_SYSTEM $LBS_SYSTEM
install_name_tool -id $BOOSTLIB/$LBS_THREAD $LBS_THREAD

