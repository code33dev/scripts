sudo apt -y install g*-9
sudo apt -y install g*-10
sudo apt -y install g*-11
sudo apt -y install g*-12
sudo apt -y install g*-13
sudo apt -y install g*-14
sudo apt -y install synaptic 
sudo apt -y install cmake git blender mm3d gimp nasm yasm geany* flex bison *boost*83*
#sudo apt -y install *boost*83* *assimp*dev *soil*dev *stb*dev *freetype*dev *glm*dev *glew-dev mesa-utils *glfw3-dev *freeglut*dev *froga* *irrl*dev *sdl2*dev *sfml*dev *allegro*dev
sudo apt -y install assimp* *glew-dev mesa-utils *glfw3-dev *freeglut*dev *sdl2*dev sfml* allegro*
sudo snap install code --classic
sudo apt -y install dotnet*8*
code --install-extension ms-dotnettools.csharp
dotnet new --install MonoGame.Templates.CSharp
dotnet new mgdesktopgl -o MyGame
cd MyGame
dotnet build
