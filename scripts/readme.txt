- MANUAL STEPS

- you need XCode Development kit from Apple, and command line tools

- download openvdb
cd $LIBRARY_BASE
git clone --recursive https://github.com/kabukunz/openvdb

- download boost 1.66_0 into $BOOSTDIR
- dowload blosc
https://github.com/Blosc/c-blosc.git
git checkout 6a196dfbc193b32f9969265c3761a158d5692aeb

- Brew install:


find all strings: "# ***** CHANGE" in files and make changes accordingly

need to: brew install dylibbundler -> used for bundling libraries