cmake_minimum_required(VERSION 3.20.0)
project(PropagatedProperties CXX)

add_library(source1 empty.cpp)
set_property(TARGET source1 PROPERTY INTERFACE_LIB_VERSION 4)
#[[ Now we set the requirement that the Property LIB_VERSION needs to be the same String for
    the libraries that we include --> If there is a mismatch between them, the compilation
    will terminate.

    It doesn't matter on which of the targets you include the property check. The check
    will be "propagated" into the other instances as well.
#]]
set_property(TARGET source1 APPEND PROPERTY COMPATIBLE_INTERFACE_STRING LIB_VERSION
)

add_library(source2 empty.cpp)
set_property(TARGET source2 PROPERTY INTERFACE_LIB_VERSION 4)

add_executable(destination empty.cpp)
target_link_libraries(destination source1 source2)
