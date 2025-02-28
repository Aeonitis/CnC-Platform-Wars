# C&C: Red Alert [Platform Wars]

**Overview:**
RedAlert is a project aimed at porting the classic Windows game, C&C: Red Alert by EA, to be multi-platform. Our goal is to build a shared library using CMake that supports various systems, including macOS and Linux.

**Project Goals:**
- Port the original C&C: Red Alert to modern platforms.
- Ensure compatibility with Linux and Apple Silicon.
- Foster a community-driven development environment.

Dev branch is `dev-red`.

## Getting Started

### Clone the Repository
Clone this project repository using Git & navigate to subfolder:
```sh
git clone https://github.com/aeonitis/CnC-Platform-Wars.git
cd CnC-Platform-Wars/REDALERT
```

### Build the Project
To build the project, use the provided `build.sh` script. This script configures the CMake build and compiles the project.

#### Usage
To run the build script, execute the following command in your terminal:

```sh
sh build.sh
```

> NOTE: Please remember, expect errors, the goal is to figure out how we can make them compile! It's Platform Wars!!

## Expected output when building

This is the first challenge, a win32 specific class, which can be copied and it's variables and functions refactored for your OS...
```shell
aeonitis@Mac REDALERT % sh build.sh
-- Configuring done (0.0s)
-- Generating done (0.0s)
-- Build files have been written to: /Users/aeonitis/dev/repos/wip/CnC-Platform-Wars/REDALERT/build
[  0%] Building CXX object CMakeFiles/RedAlert.dir/src/2keyfram.cpp.o
In file included from /Users/aeonitis/dev/repos/wip/CnC-Platform-Wars/REDALERT/src/2keyfram.cpp:39:
In file included from /Users/aeonitis/dev/repos/wip/CnC-Platform-Wars/REDALERT/include/function.h:206:
In file included from /Users/aeonitis/dev/repos/wip/CnC-Platform-Wars/REDALERT/include/win32/wwlib32.h:36:
In file included from /Users/aeonitis/dev/repos/wip/CnC-Platform-Wars/REDALERT/include/win32/gbuffer.h:110:
/Users/aeonitis/dev/repos/wip/CnC-Platform-Wars/REDALERT/include/win32/ddraw.h:29:10: fatal error: 'objbase.h' file not found
   29 | #include <objbase.h>
      |          ^~~~~~~~~~~
1 error generated.
make[2]: *** [CMakeFiles/RedAlert.dir/src/2keyfram.cpp.o] Error 1
make[1]: *** [CMakeFiles/RedAlert.dir/all] Error 2
make: *** [all] Error 2
Build completed for MACOS (Release)
```

## Planned Project Structure

Let's work towards this...
```
REDALERT/  
│── CMakeLists.txt  
│── License.txt  
├── src/               # Source files (.cpp, .c, .h, .hpp, .asm)  
│   ├── main.cpp  
│   ├── core/           # Core logic, Platform-independent (e.g., game engine, networking)  
│   ├── win32/          # Windows-specific source files (C++ and ASM)
│   ├── linux/          # Linux-specific source files
│   ├── macos/          # macOS-specific source files
│   └── resources/      # Windows .rc files, icons, etc.
│   ├── graphics/       # Rendering-related files
│   ├── audio/          # Sound-related files
│   ├── platform/       # Platform-specific implementations
│   ├── util/           # Utility/helper functions  
|   |
├── include/            # Headers (if separated from src)  
│   ├── core/           # Platform-independent headers
│   ├── win32/          # Windows-specific headers
│   ├── linux/          # Linux-specific headers
│   ├── macos/          # macOS-specific headers
│   └── resources/      # Build-time resources e.g. .rc files, UI icons, version info
├── assets/             # Runtime assets e.g. Game assets: textures (images), sounds, models, levels, etc...
├── external/           # Third-party libraries (not in build)
├── build/              # Out-of-source build directory (gitignored)  
├── tests/              # Unit tests  
│── docs/               # Documentation
│── README.md
└── LICENSE
```

**Contributing:**
I welcome contributions from the community. The most active and valuable contributors will be granted leadership roles quickly.

## Prerequisites
Before you start, ensure you have the following installed:
- CMake (version 3.15 or higher)
- A compatible C++ compiler (e.g., GCC, Clang, MSVC)
- Git (to clone the repository)


## Troubleshooting
- If you encounter any errors during the build process, ensure that all prerequisites are installed and correctly configured.
- Check the `CMakeLists.txt` file for any platform-specific settings that may need to be adjusted.

## Contributing
If you would like to contribute to the project, please follow these steps:
1. Fork the repository.
2. Create a new branch with a descriptive name (e.g., `compile-filename`), and push to branch `dev-rev` not main.
3. Make your changes and commit them with clear and concise commit messages.
4. Push your changes to your forked repository.
5. Create a pull request to the main repository.

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Contact
For any questions or inquiries, please contact yourself, you are the best person for the job!!!


## Future - The Runtime!
Once it compiles, we can go nuts on more folders :P
```
RedAlert/
├── CMakeLists.txt
├── include/            # Header files
│   │   ├── ...
│   └── ...            # Other shared headers
├── src/                # Source files (C++ & ASM)
│   ├── main.cpp        # (Optional) Entry point
│   ├── core/           # Core engine files
│   │   ├── 2KEYFRAM.CPP
│   │   ├── FACTORY.CPP
│   │   ├── KEY.CPP
│   │   ├── ...
│   ├── platform/       # OS-Specific Code
│   │   ├── win32/      # Windows-specific implementations
│   │   │   ├── RedAlert.rc
│   │   │   ├── WINDOWS.CPP
│   │   │   ├── WINCOMM.H
│   │   │   ├── ...
│   │   ├── macos/      # macOS-specific implementations
│   │   ├── linux/      # Linux-specific implementations
│   ├── engine/         # Game engine components
│   │   ├── AUDIO.H
│   │   ├── TIMER.CPP
│   │   ├── VIDEO.H
│   │   ├── ...
│   ├── graphics/       # Graphics-related files
│   │   ├── BUFFER.CPP
│   │   ├── PALETTE.CPP
│   │   ├── DRAWBUFF.H
│   │   ├── ...
│   ├── input/          # Input handling
│   │   ├── KEYBOARD.H
│   │   ├── MOUSE.H
│   │   ├── ...
│   ├── util/           # Utility files
│   │   ├── MISC.H
│   │   ├── FILE.H
│   │   ├── ...
│   ├── asm/            # Assembly files
│   │   ├── LCWCOMP.ASM
│   │   ├── MMX.ASM
│   │   ├── ...

```


## Old Readme.md
```log
# Command & Conquer Remastered Collection

This repository includes source code for TiberianDawn.dll, RedAlert.dll and the Map Editor for the Command & Conquer Remastered Collection. This release provides support to the [Steam Workshop](https://steamcommunity.com/workshop/browse/?appid=1213210) for the C&C Remaster Collection.


## Dependencies

The following dependencies must be installed to successfully build the solution;

- Windows 8.1 SDK
- MFC for Visual Studio C++ 


## Compiling (Win32 Only)

To use the compiled binaries, you must own the game. The C&C Remastered Collection is available for purchase on [EA App](https://www.ea.com/games/command-and-conquer/command-and-conquer-remastered/buy/pc) or [Steam](https://store.steampowered.com/app/1213210/Command__Conquer_Remastered_Collection/).

The quickest way to build all configurations in the project is open [CnCRemastered.sln](CnCRemastered.sln) in Microsoft Visual Studio (we recommend using 2017 as later versions report an error due to a packing mismatch with the Windows SDK headers) and select “Build” from the toolbar, then select “Batch Build”. Click the "Select All" button, then click the "Rebuild" button.

When the solution has finished building, the compiled binaries can be found in the newly created `bin` folder in the root of the repository.


## Contributing

This repository will not be accepting any contributions (pull requests, issues, etc). If you wish to create changes to the source code and encourage collaboration, please create a fork of the repository under your GitHub user/organization space.


## Support

This repository is for preservation purposes only and is archived without support. 


## License

This repository and its contents are licensed under the GPL v3 license, with additional terms applied. Please see [LICENSE.md](LICENSE.md) for details. 
```
