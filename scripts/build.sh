#! /bin/bash

# 
# ***** CHANGE TO YOUR DIRS *****
# 


# config dir, the dir you downloaded this setup
export SETUP_BASE=/Users/max/Developer/Setup



# env
source $SETUP_BASE/openvdb/setup.sh

# must be rebuilt when changing python version
source $SETUP_BASE/openvdb/build_boost.sh

source $SETUP_BASE/openvdb/build_openvdb.sh

# bundle
source $SETUP_BASE/openvdb/bundle.sh