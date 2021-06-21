## Requirements:
* Qt5
* pkg-config
* triangulation ([link](https://github.com/thequickf/polygon-decomposition))

## Building:

### Building with qmake:
I use *QtCreator* for automatic configuration and building (just open `.pro` file with QtCreator)

### Building with CMake:
1. Set up the path to the directory with your Qt cmake config as `CMAKE_PREFIX_PATH` environment variable  
  for example:  
  `export CMAKE_PREFIX_PATH=/home/ivanl/Qt/5.15.1/gcc_64`  
2. Use provided `CMakeLists.txt` and build as usual CMake project.
