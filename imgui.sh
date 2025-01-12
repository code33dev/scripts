cd frameworks
cd imgui 
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
    backends/imgui_impl_glfw.cpp
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
find_package(glfw3 REQUIRED)

target_link_libraries(imgui PUBLIC OpenGL::GL glfw)

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
    backends/imgui_impl_glfw.h
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
