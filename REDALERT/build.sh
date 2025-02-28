#!/bin/bash

# Set defaults
BUILD_TYPE="Release"
BUILD_DIR="build"

# Detect OS
OS_NAME="$(uname -s)"
case "$OS_NAME" in
    Linux*)   TARGET_OS="LINUX" ;;
    Darwin*)  TARGET_OS="MACOS" ;;
    CYGWIN*|MINGW*|MSYS*) TARGET_OS="WINDOWS" ;;
    *)        echo "Unsupported OS: $OS_NAME" && exit 1 ;;
esac

# Check for user-specified build type
if [ "$1" == "debug" ]; then
    BUILD_TYPE="Debug"
fi

# Create build directory
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR" || exit

# Run CMake using native build tools
cmake -DCMAKE_BUILD_TYPE="$BUILD_TYPE" ..

# Compile
cmake --build . --config "$BUILD_TYPE"

echo "Build completed for $TARGET_OS ($BUILD_TYPE)"
