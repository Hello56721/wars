find_path(
    GLFW_INCLUDE_DIR
    NAMES "GLFW/glfw3.h"
    PATHS "${CMAKE_SOURCE_DIR}/deps/glfw/include"
    DOC "Absolute path to GLFW's include directory."
)

if (WIN32)
    if (MSVC)
        find_library(
            GLFW_LIBRARY
            NAMES "glfw3.lib" "glfw3dll.lib"
            PATHS "${CMAKE_SOURCE_DIR}/deps/glfw/lib"
                  "${CMAKE_SOURCE_DIR}/deps/glfw/Debug/src"
                  "${CMAKE_SOURCE_DIR}/deps/glfw/Release/src"
                  "${CMAKE_SOURCE_DIR}/deps/glfw/build/Debug/src"
                  "${CMAKE_SOURCE_DIR}/deps/glfw/build/Release/src"
                  "${CMAKE_SOURCE_DIR}/deps/glfw/build/src/Debug"
                  "${CMAKE_SOURCE_DIR}/deps/glfw/build/src/Release"
            DOC "Path to GLFW's library."
        )
    else()
        find_library(
            GLFW_LIBRARY
            NAMES "libglfw3.a" "libglfw3dll.a"
            PATHS "${CMAKE_SOURCE_DIR}/deps/glfw/lib"
                  "${CMAKE_SOURCE_DIR}/deps/glfw/src"
                  "${CMAKE_SOURCE_DIR}/deps/glfw/build/src"
            DOC "Absolute path to GLFW's library."
        )
    endif()
elseif(UNIX AND NOT APPLE)
    find_library(
        GLFW_LIBRARY
        NAMES "libglfw3.a" "libglfw.so.3"
        PATHS "${CMAKE_SOURCE_DIR}/deps/glfw/lib"
              "${CMAKE_SOURCE_DIR}/deps/glfw/src"
              "${CMAKE_SOURCE_DIR}/deps/glfw/build/src"
        DOC "Absolute path to GLFW's library."
    )
endif()

include("FindPackageHandleStandardArgs")
find_package_handle_standard_args("GLFW" DEFAULT_MSG GLFW_LIBRARY GLFW_INCLUDE_DIR)