#!/bin/bash

# Array of directories with "dubious ownership"
repos=(
    "/mnt/development/repos/assimp"
    "/mnt/development/repos/boost"
    "/mnt/development/repos/box2d"
    "/mnt/development/repos/bullet"
    "/mnt/development/repos/Chipmunk2D"
    "/mnt/development/repos/freealut"
    "/mnt/development/repos/freetype"
    "/mnt/development/repos/glew"
    "/mnt/development/repos/glfw"
    "/mnt/development/repos/gli"
    "/mnt/development/repos/glm"
    "/mnt/development/repos/imgui"
    "/mnt/development/repos/openal-soft"
    "/mnt/development/repos/SOIL2"
    "/mnt/development/repos/stb"
)

# Loop through the array and add each directory to the git safe directory configuration
for repo in "${repos[@]}"; do
    git config --global --add safe.directory "$repo"
    echo "Added $repo to git safe directory"
done

echo "All repositories have been added to Git's safe directory configuration."
