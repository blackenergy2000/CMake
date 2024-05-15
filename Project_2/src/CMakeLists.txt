cmake_minimum_required(VERSION 3.20.0)
project(BankingApp CXX)

add_executable(terminalApp terminal.cpp)
add_executable(guiApp gui.cpp)

target_link_libraries(terminalApp calculations) #I want to add the library calculations to the terminalApp
target_link_libraries(guiApp calculations drawings) #I want to add libraries calculations and drawings

add_library(calculations calculations.cpp) #Create the library Calculations
add_library(drawings drawings.cpp) #Create the drawings library

add_custom_target(checksum ALL
    COMMENT "Checking the sums..."
)

# Show, that the checksum target depends on the binary of terminalApp and GuiApp --> They need to be built first
add_dependencies(checksum terminalApp guiApp)