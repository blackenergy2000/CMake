CMAKE_MINIMUM_REQUIRED(VERSION 3.20.0)
project(CMake_First_Project CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)

include(CheckIPOSupported)
check_ipo_supported(RESULT ipo_supported)
if(ipo_supported)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION True)
endif ()

message("Used Build-System: " ${CMAKE_GENERATOR})
message("Used C++-Compiler: " ${CMAKE_CXX_COMPILER})

add_executable(First_Project main.cpp)