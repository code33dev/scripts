import os
import subprocess

def run_command(command):
    """Run a shell command."""
    subprocess.run(command, shell=True, check=True)

def main():
    version = input("Enter GCC version to build (e.g., 15): ")
    gcc_folder = f"gcc-{version}"

    # Check if the GCC folder exists
    if not os.path.exists(gcc_folder):
        print(f"Folder {gcc_folder} does not exist. Cloning repository...")
        run_command(f"git clone --recursive https://github.com/gcc-mirror/gcc.git {gcc_folder}")
    else:
        print(f"Folder {gcc_folder} exists. Pulling latest changes...")
        os.chdir(gcc_folder)
        run_command("git pull")
        os.chdir("..")

    os.chdir(gcc_folder)

    # Fetch latest changes and clean the repo
    run_command("git fetch origin")
    run_command("git clean -fd")
    run_command("git reset --hard origin")

    # Download prerequisites
    run_command("contrib/download_prerequisites")

    # Create and enter build directory
    #build_dir = os.path.join(gcc_folder, "build")
    os.makedirs("build", exist_ok=True)
    os.chdir("build")

    # Configure GCC build
    configure_command = (
        "../configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu "
        "--target=x86_64-linux-gnu --prefix=/usr --enable-checking=release "
        "--enable-languages=c,c++,d,go,lto,rust,m2,objc,obj-c++,fortran "
        "--disable-multilib --disable-bootstrap --program-suffix=-" + version
    )
    run_command(configure_command)

    # Build and install GCC
    run_command("make -j 16")
    run_command("sudo make install-strip")

    # Set up alternatives for GCC and other languages
    languages = {
        "gcc": "gcc",
        "g++": "g++",
        "gobjc": "gobjc",
        "gobjc++": "gobjc++",
        "gdc": "gdc",
        "gccgo": "gccgo",
        "gccrs": "gccrs",
        "gfortran": "gfortran",
    }

    for lang, binary in languages.items():
        for i in range(9, int(version) + 1):
            run_command(f"sudo update-alternatives --install /usr/bin/{binary} {binary} /usr/bin/{binary}-{i} {i}")

if __name__ == "__main__":
    try:
        main()
    except subprocess.CalledProcessError as e:
        print(f"An error occurred while executing: {e.cmd}")
