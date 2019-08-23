NOTE: as of 08/23/2019 this is not working anymore

***** BUILDING OPENVDB FOR MAC OS *****

- you need XCode Development kit from Apple, and command line tools

- you need Python 3.5.3 (2.79) or 3.7.0 (2.80) from www.python.org

- and bash (terminal)

- find all strings: "# ***** CHANGE" in this setup files and make changes accordingly

- download openvdb
cd $LIBRARY_BASE
git clone --recursive https://github.com/kabukunz/openvdb

- download boost 1.66_0 into $BOOSTDIR
- dowload blosc into $BLOSCDIR
https://github.com/Blosc/c-blosc.git
git checkout 6a196dfbc193b32f9969265c3761a158d5692aeb

- Brew install (for building openvdb)
openexr (2.2.0_1)
ilmbase (2.2.1)
tbb (2018_U5)
glfw (3.2.1)

- Brew install (for bundling libraries)
dylibbundler (0.4.4)

- launch build.sh in this directory