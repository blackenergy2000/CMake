cmake_minimum_required(VERSION 3.20.0)

function(foo)
    #list(APPEND CMAKE_MESSAGE_CONTEXT "foo")
    list(APPEND CMAKE_MESSAGE_INDENT "  ")
    message("foo message")
endfunction()

#list(APPEND CMAKE_MESSAGE_CONTEXT "top")
message("Before \"foo\"")
foo()
message("After \"foo\"")

# cmake -P message_context.cmake --log-context #Script-Command to execute the script with context info
