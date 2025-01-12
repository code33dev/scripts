# git clone --recursive https://github.com/gcc-mirror/gcc.git gcc-$1
cd gcc-$1
# git fetch origin
# git clean -fd
# git reset --hard origin
# contrib/download_prerequisites
rm -rf build
mkdir build
cd build
#,d,go,lto,rust,m2,objc,obj-c++
../configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --prefix=/usr --enable-checking=release --enable-languages=c,c++,d,go,lto,rust,m2,objc,obj-c++,fortran --disable-multilib --disable-bootstrap --program-suffix=-$1
make -j 16
sudo make install-strip
# GCC and G++ (C and C++ compilers)
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 11
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 11
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 12
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 13
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 13
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 14
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 14
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-15 15
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-15 15

# # Objective-C and Objective-C++
# sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-9 9
# sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-9 9
# sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-10 10
# sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-10 10
# sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-11 11
# sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-11 11
# sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-12 12
# sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-12 12
# sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-13 13
# sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-13 13
# sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-14 14
# sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-14 14
# sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-15 15
# sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-15 15

# # D Language
# sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gcc-9 9
# sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gcc-10 10
# sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gcc-11 11
# sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gcc-12 12
# sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gcc-13 13
# sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gcc-14 14
# sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gcc-15 15

# # Go Language
# sudo update-alternatives --install /usr/bin/gccgo gccgo /usr/bin/gcc-9 9
# sudo update-alternatives --install /usr/bin/gccgo gccgo /usr/bin/gcc-10 10
# sudo update-alternatives --install /usr/bin/gccgo gccgo /usr/bin/gcc-11 11
# sudo update-alternatives --install /usr/bin/gccgo gccgo /usr/bin/gcc-12 12
# sudo update-alternatives --install /usr/bin/gccgo gccgo /usr/bin/gcc-13 13
# sudo update-alternatives --install /usr/bin/gccgo gccgo /usr/bin/gcc-14 14
# sudo update-alternatives --install /usr/bin/gccgo gccgo /usr/bin/gcc-15 15

# # Rust Language
# sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-9 9
# sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-10 10
# sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-11 11
# sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-12 12
# sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-13 13
# sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-14 14
# sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-15 15
