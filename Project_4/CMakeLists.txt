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
target_link_libraries(Main MyClass Warning_Settings)

get_target_property( cmake_gcc_options_try_c COMPILE_OPTIONS)
# also see: COMPILE_DEFINITIONS INCLUDE_DIRECTORIES
message("-- Target compiler flags are: ${MAIN_CFLAGS}")

add_custom_command(TARGET cmake_gcc_options_try_c POST_BUILD
        COMMAND echo built with the flags: ${MAIN_CFLAGS})