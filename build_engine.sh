cd engine 
rm -rf build
mkdir build
cd build
cmake ..
make -j 16
make install
cd ../../MyGame
./demo
