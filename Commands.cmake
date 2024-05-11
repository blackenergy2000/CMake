cmake_minimum_required(VERSION 3.20.0)

#[[ There are two ways in which you are able to create functions in CMake. The first one can be seen as the Macros that
    work the same as C-Macros. You can create those methods via the macro() command and the created method works as an
    find and replace instruction. The second method-style can be created by using the function() command that if called
    actually creates an separate entry on call stack.

    This also means that calling the return command in the macros return one scope higher up then in the function.
]]

macro(MyMacro myVar)
    set(myVar "new value")
    message("argument: ${myVar}")
endmacro()

set(myVar "first Value")
message("myVar ist now: ${myVar}")
MyMacro("called value")
message("myVar is now: ${myVar}")

message("\nBecause of the shown behaviour it is recommended to use functions rather then macros if possible.")

message("\nWhen changing values inside of a function you have to be careful that you have to set the value with the
decorator \"PARENT_SCOPE\" if you want to change the value in the scope of the caller.\n")

function(MyFunction FirstArg)
    message("Function: ${CMAKE_CURRENT_FUNCTION}")
    message("File: ${CMAKE_CURRENT_LIST_FILE}")
    message("FirstArg: ${FirstArg}")
    set(FirstArg "new Value")
    message("First Arg again: ${FirstArg}")
    message("ARGV0: ${ARGV0} ARGV1: ${ARGV1} ARGC: ${ARGC}")
endfunction()

set(FirstArg "first Value")
MyFunction("Value1" "Value2")
message("FirstArg in global scope ${FirstArg}")
