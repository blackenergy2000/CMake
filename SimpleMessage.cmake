cmake_minimum_required(VERSION 3.20.0)

message("Hello World")

set(GCC_PATH "C:\\Entwicklungstools\\MSYS2\\mingw64\\bin\\g++.exe")
message("Compiler-Standort: " ${GCC_PATH})

set(myList a list of five elements)

message(${myList})

#[=[ 
    lists has a couple of function that can be found under list(). The syntax of those 
    is close to the used syntax of the C++ std::Vector which can be fused with different
    vectors and can also be adjustet on element bases.  
]=]

message("The end was reached!")