cmake_minimum_required(VERSION 3.15)
project(RedAlert)

# Detect platform
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(TARGET_OS WINDOWS)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(TARGET_OS MACOS)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(TARGET_OS LINUX)
else()
    message(FATAL_ERROR "Unsupported OS: ${CMAKE_SYSTEM_NAME}")
endif()

# Set common compilation options
add_compile_options(-Wall -Wextra)

# Set common definitions
add_compile_definitions(TRUE_FALSE_DEFINED ENGLISH)

# Define the library sources
file(GLOB_RECURSE CPP_SOURCES src/*.cpp)
file(GLOB_RECURSE ASM_SOURCES src/*.asm)

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/include)
include_directories(${PROJECT_SOURCE_DIR}/include/win32)

# Create the shared library target **before** linking libraries
add_library(RedAlert SHARED ${CPP_SOURCES} ${ASM_SOURCES})

# Now link libraries after defining the target
if(TARGET_OS STREQUAL "WINDOWS")
    target_link_libraries(RedAlert winmm Ws2_32)
elseif(TARGET_OS STREQUAL "MACOS")
    target_link_libraries(RedAlert) # Add macOS-specific libs if needed
elseif(TARGET_OS STREQUAL "LINUX")
    target_link_libraries(RedAlert) # Add Linux-specific libs if needed
endif()

# Set compilation flags based on the target OS
if(TARGET_OS STREQUAL "MACOS")
    # file(GLOB_RECURSE WIN32_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/include/win32/*)
    # include_directories(${WIN32_INCLUDE_DIRS})
    
    if(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm64")
        add_definitions(-DAPPLE_SILICON)
        set(CMAKE_OSX_ARCHITECTURES "arm64")
    else()
        set(CMAKE_OSX_ARCHITECTURES "x64")
    endif()
    target_compile_definitions(RedAlert PRIVATE MACOS)
elseif(TARGET_OS STREQUAL "WINDOWS")
    target_compile_definitions(RedAlert PRIVATE WIN32 _WINDOWS _USRDLL REDALERT_EXPORTS)
    add_compile_options(/W3 /MP)
elseif(TARGET_OS STREQUAL "LINUX")
    target_compile_definitions(RedAlert PRIVATE LINUX)
endif()

# Set target architecture
if(CMAKE_SYSTEM_PROCESSOR MATCHES "arm64")
    set(TARGET_ARCH ARM64)
else()
    set(TARGET_ARCH X64)
endif()

# Set output directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Build type configuration
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    add_compile_definitions(NDEBUG)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
else()
    add_compile_definitions(_DEBUG)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
endif()

# Enable assembly language settings
if(TARGET_OS STREQUAL "WINDOWS")
    enable_language(ASM_MASM)
    set_source_files_properties(${ASM_SOURCES} PROPERTIES LANGUAGE ASM_MASM)
else()
    enable_language(ASM)
    set_source_files_properties(${ASM_SOURCES} PROPERTIES LANGUAGE ASM)
endif()
