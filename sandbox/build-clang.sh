#!/bin/bash

# Exit on error
set -e

# Define variables
LLVM_INSTALL_DIR="/toolchain"
NUM_CORES=$(nproc)

# Step 1: Install prerequisites
echo "Installing prerequisites..."
sudo apt update
sudo apt install -y build-essential cmake ninja-build git python3

# Step 2: Clone LLVM repository
echo "Cloning LLVM repository..."
if [ ! -d "llvm-project" ]; then
    git clone https://github.com/llvm/llvm-project.git
else
    echo "LLVM project already cloned, skipping."
fi
cd llvm-project

# Step 3: Create build directory
echo "Creating build directory..."
mkdir -p build
cd build

# Step 4: Configure the build
echo "Configuring the build..."
cmake -G Ninja ../llvm \
  -DLLVM_ENABLE_PROJECTS="clang;lld" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$LLVM_INSTALL_DIR

# Step 5: Build LLVM and Clang
echo "Building LLVM and Clang using $NUM_CORES cores..."
ninja -j$NUM_CORES

# Step 6: Install LLVM and Clang
echo "Installing LLVM and Clang to $LLVM_INSTALL_DIR..."
sudo mkdir -p $LLVM_INSTALL_DIR
sudo ninja install

echo "LLVM and Clang have been successfully built and installed in $LLVM_INSTALL_DIR."
