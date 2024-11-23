Here is a script that uses all the specified packages in a compact and reusable way. The package list is placed in a variable for maintainability, and the script processes each package iteratively.
Script: install-vcpkg.sh

#!/bin/bash

# Check if the target folder is provided
if [ -z "$1" ]; then
    echo "Usage: sh install-vcpkg.sh <target-folder>"
    exit 1
fi

# Define the target folder for vcpkg
VCPKG_DIR="$1"

# Clone vcpkg if the folder doesn't already exist
if [ ! -d "$VCPKG_DIR" ]; then
    echo "Cloning vcpkg into $VCPKG_DIR..."
    git clone https://github.com/microsoft/vcpkg.git "$VCPKG_DIR" || {
        echo "Failed to clone vcpkg. Exiting."
        exit 1
    }
else
    echo "vcpkg directory already exists: $VCPKG_DIR"
fi

# Navigate to vcpkg directory
cd "$VCPKG_DIR" || exit

# Bootstrap vcpkg
echo "Bootstrapping vcpkg..."
./bootstrap-vcpkg.sh || {
    echo "Failed to bootstrap vcpkg. Exiting."
    exit 1
}

# Define all packages
PACKAGES="abseil allegro5 allegro5[opengl] alsa assimp at-spi2-atk at-spi2-core atk boost-algorithm boost-align boost-any boost-array boost-asio boost-assert boost-assign boost-atomic boost-beast boost-bimap boost-bind boost-chrono boost-circular-buffer boost-cmake boost-compute boost-concept-check boost-config boost-container-hash boost-container boost-context boost-contract boost-conversion boost-core boost-coroutine boost-date-time boost-describe boost-detail boost-dll boost-dynamic-bitset boost-endian boost-exception boost-fiber boost-filesystem boost-foreach boost-format boost-function-types boost-function boost-functional boost-fusion boost-geometry boost-graph boost-hana boost-headers boost-heap boost-histogram boost-hof boost-icl boost-integer boost-interprocess boost-interval boost-intrusive boost-io boost-iostreams boost-iostreams[bzip2] boost-iostreams[lzma] boost-iostreams[zlib] boost-iostreams[zstd] boost-iterator boost-lambda boost-leaf boost-lexical-cast boost-locale boost-lockfree boost-log boost-logic boost-math boost-metaparse boost-move boost-mp11 boost-mpl boost-msm boost-multi-array boost-multi-index boost-multiprecision boost-nowide boost-numeric-conversion boost-odeint boost-optional boost-parameter boost-phoenix boost-poly-collection boost-polygon boost-pool boost-predef boost-preprocessor boost-process boost-program-options boost-property-map boost-property-tree boost-proto boost-ptr-container boost-qvm boost-random boost-range boost-ratio boost-rational boost-regex boost-safe-numerics boost-scope-exit boost-scope boost-serialization boost-signals2 boost-smart-ptr boost-sort boost-spirit boost-stacktrace boost-stacktrace[backtrace] boost-statechart boost-static-assert boost-static-string boost-system boost-test boost-thread boost-throw-exception boost-timer boost-tokenizer boost-tti boost-tuple boost-type-erasure boost-type-index boost-type-traits boost-typeof boost-ublas boost-uninstall boost-units boost-unordered boost-utility boost-uuid boost-variant2 boost-variant boost-vmd boost-wave boost-winapi boost-xpressive box2d brotli bullet3 bzip2 bzip2[tool] cairo cairo[fontconfig] cairo[freetype] cairo[gobject] cairo[x11] cereal cgltf cgns cgns[hdf5] cgns[lfs] cgns[lfsselector] chipmunk chronoengine cpuid cuda curl curl[non-http] curl[openssl] curl[ssl] dbus dbus[systemd] dirent double-conversion draco drlibs egl-registry egl eigen3 expat exprtk fast-float fastgltf flatbuffers fluidsynth fluidsynth[buildtools] fmt fontconfig freealut freeglut freeimage freetype freetype[brotli] freetype[bzip2] freetype[png] freetype[zlib] freexl fribidi gdk-pixbuf gdk-pixbuf[jpeg] gdk-pixbuf[png] gdk-pixbuf[tiff] geos getopt gettext-libintl gettext gettext[tools] giflib gklib glad glad[loader] glew glfw3 gli glib glm glslang gperf graphene graphicsmagick gtk harfbuzz harfbuzz[freetype] harfbuzz[glib] hdf5 hdf5[szip] hdf5[tools] hdf5[zlib] imath imgui imgui[docking-experimental] imgui[freetype] imgui[sdl2-binding] imgui[sdl2-renderer-binding] jasper jasper[default-features] jasper[opengl] jhasse-poly2tri json-c jsoncpp jxrlib ktx kubazip lcms lerc libaec libbacktrace libcap libdeflate libdeflate[compression] libdeflate[decompression] libdeflate[gzip] libdeflate[zlib] libepoxy libffi libflac libflac[stack-protector] libgeotiff libgta libharu libiconv libjpeg-turbo libkml liblzma libmount libogg libpng libpq libpq[lz4] libpq[openssl] libpq[zlib] libraw libsass libspatialite libspatialite[freexl] libsquish libsystemd libtheora libuuid libvorbis libwebp libwebp[libwebpmux] libwebp[nearlossless] libwebp[simd] libxcrypt libxml2 libxml2[http] libxml2[iconv] libxml2[lzma] libxml2[zlib] lz4 metis mimalloc miniaudio minimp3 minizip mmx mpg123 nanogui nanosvg nanovg netcdf-c netcdf-c[dap] netcdf-c[hdf5] netcdf-c[nczarr] netcdf-c[netcdf-4] nlohmann-json nvtt openal-soft opencl openexr opengl-registry opengl openjpeg openssl opus opusfile pango pcre2 pcre2[jit] pcre2[platform-default-features] pegtl physfs pixman pkgconf polyclipping proj proj[net] proj[tiff] pthread pthreads pugixml qhull qoi quirc rapidjson raylib raylib[use-audio] robin-hood-hashing robin-map sassc sdl1 sdl2-gfx sdl2-mixer-ext sdl2-mixer sdl2-mixer[fluidsynth] sdl2-mixer[libflac] sdl2-mixer[mpg123] sdl2-mixer[opusfile] sdl2-mixer[wavpack] sdl2-net sdl2 sdl2[dbus] sdl2[ibus] sdl2[wayland] sdl2[x11] sdl3 sdl3[ibus] sdl3[wayland] sdl3[x11] seacas shaderc simdjson simdjson[deprecated] simdjson[exceptions] simdjson[threads] simdjson[utf8-validation] soil2 soil spirv-cross spirv-headers spirv-reflect spirv-tools sqlite3 sqlite3[json1] sqlite3[rtree] sqlite3[tool] stb tbb tiff tiff[jpeg] tiff[lzma] tiff[zip] tinygltf tinyxml uriparser utfcpp valijson vcpkg-boost vcpkg-cmake-config vcpkg-cmake-get-vars vcpkg-cmake vcpkg-get-python-packages vcpkg-pkgconfig-get-modules vcpkg-tool-meson verdict volk vulkan-headers vulkan-hpp vulkan-loader vulkan-memory-allocator vulkan-sdk-components vulkan-tools vulkan-utility-libraries vulkan-validationlayers vulkan wavpack zlib zstd zziplib"

# Install all packages
echo "Installing all packages..."
for PACKAGE in $PACKAGES; do
    echo "Installing: $PACKAGE"
    ./vcpkg install "$PACKAGE" || {
        echo "Failed to install $PACKAGE. Exiting."
        exit 1
    }
done

echo "All packages installed successfully."
