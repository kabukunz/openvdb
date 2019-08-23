#! /bin/bash


# 
# ***** CHANGE TO REQUIRED PYTHON VERSION *****
# 


# export BLENDER_VERSION=2.79
export BLENDER_VERSION=2.80

#
# SET PYTHON DEV ENV 2.79
# 

# python dir for Blender 2.79
# export PYTHONDIR=/Users/max/.pyenv/versions/3.5.3

# python version for Blender 2.79
# export PYTHON_VERSION=3.5m


#
# SET PYTHON DEV ENV 2.80
# 

# python dir for Blender 2.80 beta
export PYTHONDIR=/Library/Frameworks/Python.framework/Versions/3.7

# # python version for Blender 2.80 beta
export PYTHON_VERSION=3.7m


# 
# ***** CHANGE TO REQUIRED ADDON VERSION *****
# 


# addon dir
export ADDON_BASE=$WORKSPACE_BASE/Blender/addons

# setup module dir
# export OPENVDB_ADDON=$ADDON_BASE/openvdb/vdb_remesh_b2.79-mojave10.14.3/openvdb-remesh
# export OPENVDB_MODULES=$OPENVDB_ADDON/pyopenvdb/w35

export OPENVDB_ADDON=$ADDON_BASE/openvdb/vdb_remesh_b2.80-mojave10.14.3/openvdb-remesh
export OPENVDB_MODULES=$OPENVDB_ADDON/pyopenvdb/w37

# blender target
# export BLENDER_TARGET=/usr/local/Blender/blender-2.79b-macOS-10.6_test
export BLENDER_TARGET=/usr/local/Blender/blender-2.80.0-git20190326.adfdae3fc2f4-x86_64_test


# 
# ***** CHANGE TO OPENVDB DIR *****
# 


# build dir
export LIBRARY_BASE=/Volumes/Code/Library

# openvdb setup dirs
export OPENVDBDIR=$LIBRARY_BASE/Graphics/openvdb/openvdb 
export OPENVDBLIB=$OPENVDBDIR/build/python/lib/python${PYTHON_VERSION}



# 
# ***** CHANGE TO BOOST / BLOSC DIR *****
# 

# these two are built from source
# boost 1.66 is mandatory, otherwise you have to change a lot more things

# boost libs dirs
export BOOSTDIR=$LIBRARY_BASE/Build/boost_1_66_0
export BOOSTLIB=$BOOSTDIR/release/lib

# blosc dirs
export BLOSCDIR=$LIBRARY_BASE/Build/c-blosc



# 
# ***** CHANGE TO RELATED DIRS *****
# 


# these uses Brew

# openexr dir
export OPENEXRDIR=/usr/local/Cellar/openexr/2.2.0_1

# ilmbase dir
export ILMBASEDIR=/usr/local/Cellar/ilmbase/2.2.1

# tbb dir
export TBBDIR=/usr/local/Cellar/tbb/2018_U5

# glfw dir
export GLFWDIR=/usr/local/Cellar/glfw/3.2.1


# DON'T TOUCH THESE

# boost libraries for relocating links
export LBS_IOSTREAM=libboost_iostreams-clang-darwin42-mt-x64-1_66.dylib
export LBS_NUMPY=libboost_numpy3-clang-darwin42-mt-x64-1_66.dylib
export LBS_PYTHON=libboost_python3-clang-darwin42-mt-x64-1_66.dylib
export LBS_SYSTEM=libboost_system-clang-darwin42-mt-x64-1_66.dylib
export LBS_THREAD=libboost_thread-clang-darwin42-mt-x64-1_66.dylib