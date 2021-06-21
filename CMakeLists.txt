cmake_minimum_required(VERSION 3.10.0)

set(CMAKE_CXX_STANDARD 17)

project(polygon-decomposition-demo)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(QT NAMES Qt5 Qt6 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)
include(FindPkgConfig)
pkg_check_modules(TRIANGULATION triangulation REQUIRED)

add_executable(polygon_decomposition_demo
    src/main.cpp
    src/polygon.cpp
    qml/qml.qrc
)

target_include_directories(polygon_decomposition_demo PRIVATE
    src)

target_link_libraries(polygon_decomposition_demo PRIVATE
    Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick triangulation)
