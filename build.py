import os
import subprocess
import shutil
from datetime import datetime

def run_command(command, cwd=None):
    """Run a shell command and exit on failure."""
    try:
        subprocess.run(command, shell=True, check=True, cwd=cwd)
    except subprocess.CalledProcessError as e:
        print(f"Error while running: {command}\n{e}")
        exit(1)

def set_compiler_version(version):
    """Set the GCC and G++ compiler alternatives."""
    run_command(f"sudo update-alternatives --set gcc /usr/bin/gcc-{version}")
    run_command(f"sudo update-alternatives --set g++ /usr/bin/g++-{version}")

def clean_and_prepare_directories():
    """Clean and create required directories."""
    dirs_to_remove = ["mnt/development/sdk_old", "mnt/development/sdk", "mnt/development/frameworks"]
    for directory in dirs_to_remove:
        shutil.rmtree(directory, ignore_errors=True)

    # Create the frameworks directory
    os.makedirs("frameworks", exist_ok=True)

    # Copy libraries from repos into the frameworks directory
    if os.path.exists("repos"):
        for item in os.listdir("repos"):
            source = os.path.join("repos", item)
            destination = os.path.join("frameworks", item)
            if os.path.isdir(source):
                shutil.copytree(source, destination, dirs_exist_ok=True)
                print(source, destination)
            else:
                shutil.copy2(source, destination)
    else:
        print("Error: 'repos' directory not found. Please ensure it exists.")
        exit(1)

    # Remove .git directories from frameworks
    for root, dirs, _ in os.walk("frameworks"):
        for dir_name in dirs:
            if dir_name == ".git":
                shutil.rmtree(os.path.join(root, dir_name), ignore_errors=True)

def build_library(directory, cmake_args, lib_name):
    """Build a library using CMake and Make."""
    build_dir = os.path.join(directory, "build")
    
    # Remove the existing build directory if it exists
    if os.path.exists(build_dir):
        shutil.rmtree(build_dir)

    # Create a new build directory
    os.makedirs(build_dir, exist_ok=True)

    # Save the current working directory to return later
    original_dir = os.getcwd()

    try:
        # Change to the build directory
        os.chdir(build_dir)

        # Ensure CMake install prefix points to the sdk folder
        cmake_args.append("-DCMAKE_INSTALL_PREFIX=../../sdk")
        
        # Set the CMake install configuration to avoid installation conflicts
        cmake_args.append("-DBOX2D_CMAKE_CONFIG_PATH=../../sdk/share/cmake/box2d")

        # Run cmake and make commands in the current directory (which is the build directory now)
        if "box2d" not in lib_name:
            run_command(f"cmake {' '.join(cmake_args)} ..")
            run_command("make -j$(nproc)")
            run_command("make install")
        else:
            run_command(f"cmake {' '.join(cmake_args)} ..")
            run_command("make -j$(nproc)")
            run_command("mv ./src/libbox2d.a ../../sdk/lib")
            run_command("mv ../include/box2d ../../sdk/include")
        
    except subprocess.CalledProcessError as e:
        if lib_name == "box2d":
            print(f"Warning: Failed to build {lib_name}. Continuing with the next library.")
        else:
            print(f"Error while building {lib_name}: {e}")
            exit(1)
    finally:
        # Ensure to return to the original directory after building the library
        os.chdir(original_dir)

def install_glew():
    """Run the custom GLEW installation commands directly."""
    command = """
    cd frameworks &&
    cd glew &&
    cd auto &&
    sed -i 's/PYTHON ?= python/PYTHON ?= python3/' Makefile &&
    cd .. &&
    make extensions &&
    make -j 16 &&
    make install GLEW_DEST=../sdk &&
    mv ../sdk/lib64/*.a ../sdk/lib &&
    rm -rf ../sdk/lib64 &&
    cd ..
    cd ..
    """
    try:
        subprocess.run(command, shell=True, check=True)
        print("GLEW installation completed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error during GLEW installation: {e}")

def build_all_libraries():
    """Build all libraries found in the frameworks folder."""
    frameworks_dir = "frameworks"
    cmake_args_map = {
        "zlib": ["-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "SOIL2": ["-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "boost": ["-DBOOST_RUNTIME_LINK=ON", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "assimp": ["-DASSIMP_BUILD_ZLIB=ON -DBUILD_SHARED_LIBS=OFF", "-DASSIMP_BUILD_TESTS=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "glfw": ["-DGLFW_BUILD_TESTS=OFF", "-DGLFW_BUILD_EXAMPLES=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "box2d": ["-DBOX2D_SAMPLES=OFF -DBOX2D_BENCHMARKS=OFF -DBOX2D_DOCS=OFF -DCMAKE_INSTALL_PREFIX=../../sdk"],
        "bullet": ["-DBUILD_SHARED_LIBS=OFF", "-DBUILD_UNIT_TESTS=OFF", "-DBUILD_BULLET2_DEMOS=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "Chipmunk2D": ["-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "glm": [
            "-DGLM_ENABLE_SIMD_SSE2=ON",
            "-DGLM_ENABLE_SIMD_SSE3=ON",
            "-DGLM_ENABLE_SIMD_SSSE3=ON",
            "-DGLM_ENABLE_SIMD_SSE4_1=ON",
            "-DGLM_ENABLE_SIMD_SSE4_2=ON",
            "-DGLM_ENABLE_SIMD_AVX=ON",
            "-DGLM_ENABLE_SIMD_AVX2=ON",
            "-DGLM_BUILD_LIBRARY=ON",
            "-DGLM_BUILD_TESTS=OFF",
            "-DGLM_ENABLE_CXX_20=ON",
            "-DCMAKE_INSTALL_PREFIX=../../sdk"
        ],
        "gli": ["-DGLI_TEST_ENABLE=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "freetype": ["-DWITH_HARFBUZZ=ON -DWITH_BROTLI=ON -DWITH_BZIP2=ON -DBUILD_SHARED_LIBS=false", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "SDL": ["-DINSTALL_STATIC=ON", "-DBUILD_SHARED=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "SDL_image": ["-DINSTALL_STATIC=ON", "-DBUILD_SHARED_LIBS=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "SDL_mixer": ["-DINSTALL_STATIC=ON", "-DBUILD_SHARED_LIBS=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "SDL_ttf": ["-DINSTALL_STATIC=ON", "-DBUILD_SHARED_LIBS=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"],
        "SDL_net": ["-DINSTALL_STATIC=ON", "-DBUILD_SHARED_LIBS=OFF", "-DCMAKE_INSTALL_PREFIX=../../sdk"]
    }

    # Iterate through each directory in the frameworks folder and build the libraries
    for directory in os.listdir(frameworks_dir):
        lib_path = os.path.join(frameworks_dir, directory)
        if os.path.isdir(lib_path):
            # Get the name of the library and use it to get the correct cmake arguments
            lib_name = directory
            if lib_name in cmake_args_map:
                print(f"Building {lib_name}...")
                build_library(lib_path, cmake_args_map[lib_name], lib_name)

    print("Building GLEW...")
    install_glew()  # Call the custom GLEW installation function


    # Build ImGui separately
    print("Building ImGui...")
    install_imgui()



def install_imgui():
    os.system('sh ./scripts/imgui.sh')
        



def post_build_cleanup():
    """Perform post-build cleanup and organize directories."""
    run_command('cp -R frameworks/sdk .')
    

def compress_sdk(version):
    """Compress the SDK directory into a .tar.xz file."""
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    tar_name = f"sdk_gcc{version}_{timestamp}.tar.xz"
    print(f"SDK is being compressed: {tar_name}")
    run_command(f"tar -C sdk -cJf {tar_name} .")  
    shutil.move(tar_name, "sandbox")
    print(f"SDK compressed and moved to sandbox: {tar_name}")

def build_sdk_artifact(version):
    gcc_version = version #input("Enter the GCC version to use (e.g., 14): ").strip()
    set_compiler_version(gcc_version)
    run_command('rm -rf sdk frameworks')
    clean_and_prepare_directories()
    build_all_libraries()        
    post_build_cleanup()
    compress_sdk(gcc_version)
    set_compiler_version("14")
    print("Build process complete.")
    

def main():
    # build_sdk_artifact(9)
    # build_sdk_artifact(10)
    # build_sdk_artifact(11)
    # build_sdk_artifact(12)
    # build_sdk_artifact(13)
    # build_sdk_artifact(14)
    build_sdk_artifact(14)

if __name__ == "__main__":
    main()
