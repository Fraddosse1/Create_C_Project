## Create C Project

## Overview
CCP is a batch script that creates a C/C++ project structure

## Project structure

# C project
```
Project_Name
├───bin
├───conf
└───Project
    ├───inc
    │       Functions.h
    │       
    ├───res
    └───src
            Functions.c
            main.c
```

# C++ project
  ```
Project_Name
├───bin
├───conf
└───Project
    ├───inc
    │       Functions.hpp
    │       
    ├───res
    └───src
            Functions.cpp
            main.cpp
```

## Requirements
To make the batch script available globally, we need to insurt the path of the .bat file into the path variable.

** METHOD 1 ** :
1) Download the .bat file.
2) Place the .bat file in the folder that you want.
3) In Search, start a search and select: System (Control Panel).
4) Click on the Advanced system settings link.
5) Click on Environment Variables.
6) In the System variables section, look for the PATH environment variable and select it.
7) Click on Edit.
8) If the PATH environment variable does not exist, click on New.
9) In the Edit System Variable (or New System Variable) window, enter the value for the PATH environment variable.
10) Click OK.
11) Close all remaining windows by clicking OK.
12) Reopen the Command Prompt window and run the "CCP" command.

** METHOD 2 ** :
1) Download the .bat file.
2) Place the .bat file in the folder that you want.
3) Click on the Windows key or click on the Search bar and type "Environment Variables".
4) Select "Edit the system environment variables".
5) Click on Environment Variables.
6) In the System variables section, look for the PATH environment variable and select it.
7) Click on Edit.
8) If the PATH environment variable does not exist, click on New.
9) In the Edit System Variable (or New System Variable) window, enter the value for the PATH environment variable.
10) Click OK.
11) Close all remaining windows by clicking OK.
12) Reopen the Command Prompt window and run the "CCP" command.
