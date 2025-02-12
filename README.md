# Create C Project                   
                      
## Overview
CCP is a batch script that creates a project structure for C/C++.

## Project structure

### C project
```css
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

### C++ project
  ```css
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
Windows 10/11

## Make it work globally
To make the batch script available globally, you need to add the path of the .bat file to the PATH variable.

### METHOD 1
1) Download the .bat file.
2) Place the .bat file in your desired folder.
3) In the search bar, type: System (Control Panel).
4) Click on the "Advanced system settings" link.
5) Click on "Environment Variables".
6) In the System variables section, look for the PATH environment variable and select it. (If the PATH environment variable does not exist, click on New and skip the next step)
7) Click on Edit.
8) In the Edit System Variable (or New System Variable) window, enter the value for the PATH environment variable.
9) Click OK.
10) Close all remaining windows by clicking OK.
11) Reopen the Command Prompt window and run the "CCP" command.

### METHOD 2
1) Download the .bat file.
2) Place the .bat file in your desired folder.
3) Click on the Windows key or click on the Search bar and type "Environment Variables".
4) Select "Edit the system environment variables".
5) Click on Environment Variables.
6) In the System variables section, look for the PATH environment variable and select it. (If the PATH environment variable does not exist, click on New and skip the next step)
7) Click on Edit.
8) In the Edit System Variable (or New System Variable) window, enter the value for the PATH environment variable.
9) Click OK.
10) Close all remaining windows by clicking OK.
11) Reopen the Command Prompt window and run the "CCP" command.
