#! /bin/bash


# 
# ***** CHANGE TO THIS SETUP PARENT DIR *****
# 


export SETUP_BASE=/Volumes/Code/Library/Graphics/openvdb


# env
source $SETUP_BASE/buildscripts/setup.sh

# must be rebuilt when changing python version
source $SETUP_BASE/buildscripts/build_boost.sh

source $SETUP_BASE/buildscripts/build_openvdb.sh

# bundle
source $SETUP_BASE/buildscripts/bundle.sh