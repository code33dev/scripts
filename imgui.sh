cd frameworks
cd imgui 
sed -i 's|#include <SDL.h>|#include <SDL2/SDL.h>|' backends/imgui_impl_sdl2.cpp
sed -i 's|#include <SDL_syswm.h>|#include <SDL2/SDL_syswm.h>|' backends/imgui_impl_sdl2.cpp
sed -i 's|#include <SDL_vulkan.h>|#include <SDL2/SDL_vulkan.h>|' backends/imgui_impl_sdl2.cpp

#cp imgui_demo.cpp /mnt/development/imgui/framework/ &&
cmake_content=$(cat <<'EOF'
cmake_minimum_required(VERSION 3.0)
project(ImGui)

# Source files for ImGui core
set(IMGUI_SRC
    imgui.cpp
    imgui_draw.cpp
    imgui_widgets.cpp
    imgui_tables.cpp
    imgui_demo.cpp
)

# Source files for OpenGL2, OpenGL3, and GLFW backends
set(IMGUI_BACKEND_SRC
    backends/imgui_impl_sdl2.cpp
    backends/imgui_impl_opengl3.cpp
    backends/imgui_impl_opengl2.cpp
)

# Add static library
add_library(imgui STATIC ${IMGUI_SRC} ${IMGUI_BACKEND_SRC})

# Include directories for ImGui core and backends
target_include_directories(imgui PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/backends
)

# Link necessary libraries (GLFW, OpenGL)
find_package(OpenGL REQUIRED)
find_package(SDL2 REQUIRED)

target_link_libraries(imgui PUBLIC OpenGL::GL SDL2)

# Installation configuration for the static library
install(TARGETS imgui
        ARCHIVE DESTINATION lib
)

# Installation of ImGui core and backend header files
install(FILES
    imconfig.h
    imgui.h
    imgui_internal.h
    imstb_rectpack.h
    imstb_textedit.h
    imstb_truetype.h
    backends/imgui_impl_sdl2.h
    backends/imgui_impl_opengl3.h
    backends/imgui_impl_opengl2.h
    DESTINATION include/imgui
)
EOF
)
echo "$cmake_content" > CMakeLists.txt 
mkdir build 
cd build 
cmake -DCMAKE_INSTALL_PREFIX=../../sdk .. 
make 
make install 
cd .. 
cd ..

#!/bin/bash

# Create the target directories
# Brotli
cd brotli
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=OFF  -DCMAKE_INSTALL_PREFIX=../../sdk .. 
make -j$(nproc)
make install
cd ../../


# HarfBuzz
cd harfbuzz
mkdir build 
cd build
cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=../../sdk .. 
make -j 16
make install
cd ..
cd ..



# BZip2
cd bzip2
mkdir build
cd build
cmake -DENABLE_STATIC_LIB=ON -DENABLE_SHARED_LIB=OFF -DCMAKE_INSTALL_PREFIX=/usr .. 
make j 16
sudo make install
sudo cp /usr/lib/x86_64-linux-gnu/libbz2_static.a /usr/lib/x86_64-linux-gnu/libbz2.a
rm -rf *
cmake -DENABLE_STATIC_LIB=ON -DENABLE_SHARED_LIB=OFF -DCMAKE_INSTALL_PREFIX=../../sdk .. 
make -j 16
make install
cp ../../sdk/lib/libbz2_static.a ../../sdk/lib/libbz2.a
cd ..
cd ..

cd woff2
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=OFF  -DCMAKE_INSTALL_PREFIX=../../sdk ..
make -j 16
make install
cd ..
cd ..

cd freetype
mkdir build
cd build
cmake \
  -D FT_REQUIRE_ZLIB=TRUE \
  -D FT_REQUIRE_BZIP2=TRUE \
  -D FT_REQUIRE_PNG=TRUE \
  -D FT_REQUIRE_HARFBUZZ=TRUE \
  -D FT_REQUIRE_BROTLI=TRUE \
  -D BUILD_SHARED_LIBS=OFF \
  -D CMAKE_INSTALL_PREFIX=../../sdk \
  -DZLIB_LIBRARY=../../sdk/lib/libz.a \
  -DZLIB_INCLUDE_DIR=../../sdk/include/ \
  -DBZIP2_LIBRARIES=../../sdk/lib/libbz2.a \
  -DBZIP2_INCLUDE_DIR=../../sdk/include/ \
  -DBROTLIDEC_LIBRARIES="../../sdk/lib/libbrotlidec.a;../../sdk/lib/libbrotlicommon.a;../../sdk/lib/libbrotlienc.a" \
  -DBROTLIDEC_INCLUDE_DIR=../../sdk/include/brotli \
  -DHARFBUZZ_LIBRARIES=../../sdk/lib/libharfbuzz.a \
  -DHARFBUZZ_INCLUDE_DIRS=../../sdk/include/harfbuzz  ..
make -j 16
make install
cd ..
cd ..

mkdir sdk/include/stb
cp -R stb/*.h* sdk/include/stb
cp -R stb/*.c* sdk/include/stb
