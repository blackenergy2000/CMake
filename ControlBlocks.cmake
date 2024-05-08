cmake_minimum_required(VERSION 3.20.0)
#[[ if-Blocks of CMake are very close to the if-Block of the C++-Standard. The difference
    is that CMake doesnt use {} to define the scopes of the blocks an that the end of the 
    if-Blocks has to be terminated with an endif()

    Operators that are available in CMake: NOT, AND, OR. Nesting conditions are also 
    available via the usage of parantheses. 

    Values can also be compared via LESS, EQUAL, GREATER, GREATER_EQUAL,...
]] 

if(1.3.4 VERSION_LESS_EQUAL 1.4)
    message("Version is valid!")
endif()

# For the comparison of Strings you need to use STREQUAL as operator

if("A" STREQUAL "B")
    message("Doesnt't make sense")
elseif("A" STREQUAL "A")
    message("Strings do match!")
endif()

#CMake also provides loops. The while()-loop and the foreach-loop
set(myList 1 2 3)
foreach(VAR IN LISTS myList ITEMS e f) #You can add custom elements in the loop-header
    message(${VAR})
endforeach()

#CMake also provides a ZIP-List 
set(l1 "one;two;three;four")
set(l2 "1;2;3;4;5")
foreach(num IN ZIP_LISTS l1 l2)
    message("num_0 = ${num_0}, num_1 = ${num_1}")    
endforeach()
