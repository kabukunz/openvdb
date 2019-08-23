#! /bin/bash

## OS X

#
# glfw
#
# symlink brew glfw include dir (lib is ok)
# mkdir /usr/local/Cellar/glfw/3.2.1/include/GL
# cd /usr/local/Cellar/glfw/3.2.1/include/GL
# ln -s /usr/local/Cellar/glfw/3.2.1/include/GLFW/glfw3.h glfw.h
# ln -s /usr/local/Cellar/glfw/3.2.1/include/GLFW/glfw3native.h glfwnative.h

#
# boost python
#
# symlink python3 libs to python
# MAYBE THIS IS IF YOU DO NOT BUILD FOR PYTHON2...
# ln -s libboost_python3.a libboost_python.a
# ln -s libboost_python3.dylib libboost_python.dylib

#
# boost custom installation
#
# removed links temporarily from brewed boost 
# foolish cmake used to take that installation irrespective of this setup
# brew unlink boost

#
# ninja / xcode
#
# Substitute "Ninja" for "XCode" if you don't use ninja

export GROUPDIR="/usr/local"
export GLFWDIR="/Users/max/Developer/Library/Build/glfw-2.7/build"

export TBB_ROOT=$GROUPDIR
export ILMBASE_ROOT=$GROUPDIR
export OPENEXR_ROOT=$GROUPDIR
export BLOSC_ROOT=$GROUPDIR
export CPPUNIT_ROOT=$GROUPDIR
cmake -Wno-dev \
    -D OPENEXR_NAMESPACE_VERSIONING=OFF \
    -D CMAKE_CXX_FLAGS="-fPIC -std=c++11" \
    -D Blosc_USE_STATIC_LIBS=ON \
    -D USE_GLFW3=OFF \
    -D Boost_USE_STATIC_LIBS=ON \
    -D OPENVDB_BUILD_UNITTESTS=OFF \
    -D Boost_DEBUG=ON \
    -D GLFW_LIBRARY_PATH="/Users/max/Developer/Library/Build/glfw-2.7/build/lib" \
    -D GLFW_INCLUDE_DIR="/Users/max/Developer/Library/Build/glfw-2.7/build/include" \
    -D BOOST_ROOT="/Users/max/Developer/Library/Build/boost_1_66_0/build" \
    -D BOOST_INCLUDEDIR="/Users/max/Developer/Library/Build/boost_1_66_0/build/include" \
    -D BOOST_LIBRARYDIR="/Users/max/Developer/Library/Build/boost_1_66_0/build/lib" \
    -D Boost_USE_MULTITHREADED=OFF \
    -G "Ninja" \
    ..



# BLOSC_LOCATION:PATH=BLOSC_LOCATION-NOTFOUND
# CCACHE_FOUND:FILEPATH=/usr/local/bin/ccache
# CMAKE_BUILD_TYPE:STRING=
# CMAKE_INSTALL_PREFIX:PATH=/usr/local
# CMAKE_OSX_ARCHITECTURES:STRING=
# CMAKE_OSX_DEPLOYMENT_TARGET:STRING=
# CMAKE_OSX_SYSROOT:STRING=
# GLFW_INCLUDE_DIR:STRING=GLFW_LOCATION-NOTFOUND/include
# GLFW_INCLUDE_DIRECTORY:STRING=GLFW_LOCATION-NOTFOUND/include
# GLFW_LIBRARY_PATH:FILEPATH=/usr/local/lib/libglfw.dylib
# GLFW_LOCATION:PATH=GLFW_LOCATION-NOTFOUND
# GLFW_glfw_LIBRARY:STRING=/usr/local/lib/libglfw.dylib
# OPENVDB_ABI_VERSION_NUMBER:STRING=
# OPENVDB_BUILD_CORE:BOOL=ON
# OPENVDB_BUILD_DOCS:BOOL=OFF
# OPENVDB_BUILD_HOUDINI_SOPS:BOOL=OFF
# OPENVDB_BUILD_MAYA_PLUGIN:BOOL=OFF
# OPENVDB_BUILD_PYTHON_MODULE:BOOL=ON
# OPENVDB_BUILD_UNITTESTS:BOOL=ON
# OPENVDB_DISABLE_BOOST_IMPLICIT_LINKING:BOOL=ON
# OPENVDB_ENABLE_3_ABI_COMPATIBLE:BOOL=ON
# OPENVDB_ENABLE_RPATH:BOOL=ON
# OPENVDB_MAJOR_VERSION_NUMBER:STRING=5
# OPENVDB_MINOR_VERSION_NUMBER:STRING=1
# OPENVDB_PATCH_VERSION_NUMBER:STRING=0
# OPENVDB_TOP_LEVEL_DIR:PATH=/Users/max/Developer/Library/Blender/openvdb