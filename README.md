# NASM - my learn

## Folders

### examples
from different sources in web

### linux_book
stolyarov.info

### tutorial
https://sonictk.github.io/asm_tutorial/

### win
my test nasm win code

## Win usage
### In NASM window
nasm -f win64 -o hello_world.obj hello_world.asm

### In Native VS Code Prompt (x86 or x64)
link 00_hello_world.obj /subsystem:console /entry:main /out:00_hello_world_basic.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib libucrt.lib

### WORK FOR ME x64
link 00_hello_world.obj /subsystem:console /out:00_hello_world_basic.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib libucrt.lib

link 00_hello_win32.obj /subsystem:console kernel32.lib legacy_stdio_definitions.lib msvcrt.lib libucrt.lib

link 01_hello.obj /subsystem:console /entry:start kernel32.lib legacy_stdio_definitions.lib msvcrt.lib libucrt.lib

link 01_hello.obj /subsystem:console kernel32.lib legacy_stdio_definitions.lib msvcrt.lib libucrt.lib