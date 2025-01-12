#!/bin/bash
# Add alternatives for C/C++ Compiler (gcc)
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
# Add alternatives for D Compiler (gdc)
echo "Adding alternatives for D Compiler (gdc)..."
sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gdc-9 9
sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gdc-10 10
sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gdc-11 11
sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gdc-12 12
sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gdc-13 13
sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gdc-14 14
sudo update-alternatives --install /usr/bin/gdc gdc /usr/bin/gdc-15 15
# Add alternatives for Objective-C Compiler (gobjc)
echo "Adding alternatives for Objective-C Compiler (gobjc)..."
sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-9 9
sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-10 10
sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-11 11
sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-12 12
sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-13 13
sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-14 14
sudo update-alternatives --install /usr/bin/gobjc gobjc /usr/bin/gcc-15 15
# Add alternatives for Objective-C++ Compiler (gobjc++)
echo "Adding alternatives for Objective-C++ Compiler (gobjc++)..."
sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-9 9
sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-10 10
sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-11 11
sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-12 12
sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-13 13
sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-14 14
sudo update-alternatives --install /usr/bin/gobjc++ gobjc++ /usr/bin/gcc-15 15
# Add alternatives for Rust Compiler (gccrs)
echo "Adding alternatives for Rust Compiler (gccrs)..."
sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-9 9
sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-10 10
sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-11 11
sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-12 12
sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-13 13
sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-14 14
sudo update-alternatives --install /usr/bin/gccrs gccrs /usr/bin/gcc-15 15
# Add alternatives for Fortran Compiler (gfortran)
echo "Adding alternatives for Fortran Compiler (gfortran)..."
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-9 9
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-10 10
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-11 11
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-12 12
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-13 13
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-14 14
sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-15 15
# Verify alternatives setup
echo "You can configure alternatives using the following commands:"
echo "  sudo update-alternatives --config gcc"
echo "  sudo update-alternatives --config gdc"
echo "  sudo update-alternatives --config gobjc"
echo "  sudo update-alternatives --config gobjc++"
echo "  sudo update-alternatives --config gccrs"
echo "  sudo update-alternatives --config gfortran"