import subprocess

# List of directories with "dubious ownership"
repos = [
    "/mnt/development/repos/assimp",
    "/mnt/development/repos/boost",
    "/mnt/development/repos/box2d",
    "/mnt/development/repos/bullet",
    "/mnt/development/repos/Chipmunk2D",
    "/mnt/development/repos/freealut",
    "/mnt/development/repos/freetype",
    "/mnt/development/repos/glew",
    "/mnt/development/repos/glfw",
    "/mnt/development/repos/gli",
    "/mnt/development/repos/glm",
    "/mnt/development/repos/imgui",
    "/mnt/development/repos/openal-soft",
    "/mnt/development/repos/SOIL2",
    "/mnt/development/repos/stb",
    "/mnt/development/repos/SDL2",
    "/mnt/development/repos/SDL2_mixer",
    "/mnt/development/repos/SDL2_image",
    "/mnt/development/repos/SDL2_ttf",
    "/mnt/development/repos/SDL2_net",
    "/mnt/development/repos/SDL3",
    "/mnt/development/repos/SDL3_mixer",
    "/mnt/development/repos/SDL3_image",
    "/mnt/development/repos/SDL3_ttf",
    "/mnt/development/repos/SDL3_net"   
]

# Add each repository to the git safe directory list
for repo in repos:
    subprocess.run(["git", "config", "--global", "--add", "safe.directory", repo], check=True)
    #subprocess.run(["git", "fetch", "origin", repo], check=True)
    subprocess.run(["git", "clean", "-fd", repo], check=True)
    #subprocess.run(["git", "reset", "--hard origin", repo], check=True)
    print(f"Added {repo} to git safe directory")

print("All repositories have been added to Git's safe directory configuration.")
