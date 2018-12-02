LÖVE Distribute

A simple script to easily package LÖVE projects for distribution.

Usage:

    ./distribute.fish [directory]

Output:

A `bin/[directory]` folder containing `macos`, `win32`, and `win64` zip files for distribution.

# TODO

* Source optimization and obfuscation with precompilation: `luajit -b example.lua example.lua`
