cmake_minimum_required(VERSION 3.0)
project(ImGui)

#set(SDL2_STATIC ON)

find_path(SDL2_INCLUDE_DIR
    NAMES SDL.h
    PATHS
        ../sdk/include/SDL2 
    NO_DEFAULT_PATH       
)

find_library(SDL2_STATIC_LIBRARY
    NAMES SDL2
    PATHS ../sdk/lib
    NO_DEFAULT_PATH  # Optional: Prevents CMake from searching in standard locations
)
string(REPLACE ".so" ".a" SDL2_STATIC_LIBRARY "${SDL2_STATIC_LIBRARY}")

message(STATUS "SDL2_INCLUDE_DIR: ${SDL2_INCLUDE_DIR}")
message(STATUS "SDL2: ${SDL2_STATIC_LIBRARY}")


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
    backends/imgui_impl_sdl2.cpp   
    backends/imgui_impl_sdlrenderer2.cpp
    backends/imgui_impl_opengl3.cpp
    backends/imgui_impl_opengl2.cpp
#   backends/imgui_impl_sdl3.cpp
#   backends/imgui_impl_sdlrenderer3.cpp
)

# Add static library
add_library(imgui STATIC ${IMGUI_SRC} ${IMGUI_BACKEND_SRC})

# Include directories for ImGui core and backends
target_include_directories(imgui PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/backends
    ${SDL2_INCLUDE_DIR}
)

# Link necessary libraries (GLFW, OpenGL)
find_package(OpenGL REQUIRED)
find_package(glfw3 REQUIRED)
find_package(SDL2 REQUIRED)
if(NOT SDL2_FOUND)
    message(FATAL_ERROR "SDL2 not found. Please install SDL2 or set CMAKE_PREFIX_PATH.")
endif()

target_link_libraries(imgui PUBLIC OpenGL::GL glfw SDL2)

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
    backends/imgui_impl_sdl2.h
    backends/imgui_impl_sdlrenderer2.h
    backends/imgui_impl_opengl3.h
    backends/imgui_impl_opengl2.h
    DESTINATION include/imgui
#   backends/imgui_impl_sdl3.h
#   backends/imgui_impl_sdlrenderer3.h

)
