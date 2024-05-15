cmake_minimum_required(VERSION 3.20.0)

project(LinkingOfHeaderOnly CXX)

add_library(MyClass INTERFACE
    src/exampleClass/exampleClass.h
)

target_include_directories(MyClass INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
        $<INSTALL_INTERFACE:include/MyClass>
)

add_library(Warning_Settings INTERFACE)
target_compile_options(Warning_Settings INTERFACE
    -Wall -Wextra -Wpedantic
)

add_executable(Main src/main.cpp)

target_compile_features(Main PUBLIC cxx_std_17)
target_link_libraries(Main MyClass)
target_link_libraries(Main Warning_Settings)

get_target_property(target_options Main COMPILE_OPTIONS)
get_target_property(interface_target_options Warning_Settings INTERFACE_COMPILE_OPTIONS)
message("-- Target compiler flags are: ${target_options}")
message("-- Target compiler flags from Interface are: ${interface_target_options}")