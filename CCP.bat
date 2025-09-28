:: CCP script to generate a predefined structure for a C/CPP project
:: CCP = Create_C_Project.bat

@echo off

echo =======================================
echo	       _____ _____ _____
echo	      ^/ ____^/ ____^|  __ ^\ 
echo	     ^| ^|   ^| ^|    ^| ^|__^) ^|
echo	     ^| ^|   ^| ^|    ^|  ___^/ 
echo	     ^| ^|___^| ^|____^| ^|     
echo	      ^\_____^\_____^|_^|                          
echo =======================================
echo.

:: Input the name of the project
:NameProject
echo.
set "Name="
set /p Name=^> Enter the name of the project : 
if not defined Name (
    echo.
    echo [31m^>^> Error: Empty input. Please chose a name.[0m
    goto NameProject
)


:VerificationName
echo.
set "Verification="
set /p Verification=^> Are you sure ? ^(y/n^) : 
if not defined Verification (
    echo.
    echo [31m^>^> Error: Empty input. Please enter 'y' or 'n'.[0m
    goto VerificationName
)

if /i "%Verification%" NEQ "y" (
    if /i "%Verification%" NEQ "n" (
        echo [31m^>^> Error: Invalid input. Please enter 'y' or 'n'.[0m
        goto VerificationName 
    ) else (
        goto NameProject
    )
)

:: Input type of project (c/cpp)
:InputType
echo.
set "type="
set /p type=^> Enter the project langage (c/cpp) : 

if /i not defined type (
    echo.
    echo [31m^>^> Error: Empty input. Please enter 'c' or 'cpp'.[0m
    goto InputType
)

if /i "%type%" NEQ "c" (
    if /i "%type%" NEQ "cpp" (
        echo.
        echo [31m^>^> Error: Invalid input. Please enter 'c' or 'cpp'.[0m
        goto InputType
    )
)

:: Input the PATH of the project
:InputPath
echo.
set "ProjectPath="
set /p ProjectPath=^> Enter the path of the project : 

if not defined ProjectPath (
    echo.
    echo [31m^>^> Error: Empty input. Please enter a valid path.[0m
    goto InputPath
)

:: Check if its a valid path
if NOT EXIST "%ProjectPath%" (
    echo.
    echo [31m^>^> Error: Invalid input. Please enter a valid path.[0m
    goto InputPath
)

:VerificationPath
echo.
set "Verification="
set /p Verification=^> Are you sure ? ^(y/n^) : 

if not defined Verification (
    echo.
    echo [31m^>^> Error: Empty input. Please enter 'y' or 'n'.[0m
    goto VerificationPath
)

if /i "%Verification%" NEQ "y" (
    if /i "%Verification%" NEQ "n" (
        goto VerificationPath 
    ) else (
        goto InputPath
    )
)

:: Check if the user wants a build system
:WantBuildSystem
echo.
set "Want_Build_System="
set /p Want_Build_System=^> Do you want to add a build system ? ^(y/n^) : 

if not defined Want_Build_System (
    echo.
    echo [31m^>^> Error: Empty input. Please enter 'y' or 'n'.[0m
    goto WantBuildSystem
)

if /i "%Want_Build_System%" NEQ "y" (
    if /i "%Want_Build_System%" NEQ "n" (
        echo.
        echo [31m^>^> Error: Invalid input. Please enter 'y' or 'n'.[0m
        goto WantBuildSystem
    )
)

:: Input the build system
if /i "%Want_Build_System%"=="y" (
    :BuildSystem
    set "Build_System="
    echo.
    set /p Build_System=^> Enter the build system ^(Make/CMake^) : 
    if not defined Build_System (
        echo.
        echo [31m^>^> Error: Empty input. Please enter 'Make' or 'CMake'.[0m
        goto BuildSystem
    )

    if /i "%Build_System%" NEQ "Make" (
        if /i "%Build_System%" NEQ "CMake" (
            echo.
            :: echo !Build_System!
            echo [31m^>^> Error: Invalid input. Please enter 'Make' or 'CMake'.[0m
            goto BuildSystem
        )
    )
)

:: Début de création
echo.
echo [33mCREATION START[0m

:: Redirection vers le path indiqué
echo.
echo Redirection to the given PATH...
cd %ProjectPath%

:: Création des répertoires du projet
echo.
echo Creation of the directories...
mkdir %Name%^
    %Name%\conf^
    %Name%\bin^
    %Name%\build^
    %Name%\lib^
    %Name%\Project\src^
    %Name%\Project\inc^
    %Name%\Project\res

echo [32mDirectories created successfully.[0m

if /i "%type%"=="c" (
    :: Création des fichiers .c
    echo.
    echo Creation of the C files...

    :: Création des fichiers .c
    echo. > %Name%\Project\src\main.c
    echo. > %Name%\Project\src\Functions.c    

    :: Remplissage par défaut main.c
    echo #include ^<stdio.h^> > %Name%\Project\src\main.c
    echo. >> %Name%\Project\src\main.c
    echo int main^(^) { >> %Name%\Project\src\main.c
    echo. >> %Name%\Project\src\main.c
    echo	printf^("Hello world"^); >> %Name%\Project\src\main.c
    echo. >> %Name%\Project\src\main.c
    echo } >> %Name%\Project\src\main.c

    :: Remplissage par défaut Functions.c
    echo #include ^<stdio.h^> > %Name%\Project\src\Functions.c
    echo #include "../inc/Functions.h" >> %Name%\Project\src\Functions.c
    echo. >> %Name%\Project\src\Functions.c
    echo // Functions content >> %Name%\Project\src\Functions.c

    :: Message de succès
    echo [32mC files created successfully.[0m

    :: Création des fichiers .h
    echo.
    echo Creation of the header files.
        
    :: Création des fichiers .h
    echo. > %Name%\Project\inc\Functions.h

    :: Remplissage par défaut Functions.h
    echo #ifndef __FUNCTIONS__ > %Name%\Project\inc\Functions.h
    echo #define __FUNCTIONS__ >> %Name%\Project\inc\Functions.h
    echo. >> %Name%\Project\inc\Functions.h
    echo // Header content >> %Name%\Project\inc\Functions.h
    echo. >> %Name%\Project\inc\Functions.h
    echo #endif >> %Name%\Project\inc\Functions.h

    echo [32mHeader files created successfully.[0m
) else (
    :: Création des fichiers .cpp
    echo.
    echo Creation of the CPP files...

    :: Création des fichiers .cpp
    echo. > %Name%\Project\src\main.cpp
    echo. > %Name%\Project\src\Functions.cpp

    :: Remplissage par défaut main.cpp
    echo #include ^<iostream^> > %Name%\Project\src\main.cpp
    echo. >> %Name%\Project\src\main.cpp
    echo int main^(^) { >> %Name%\Project\src\main.cpp
    echo. >> %Name%\Project\src\main.cpp
    echo	std::cout ^<^< "Hello world" ^<^< std::endl; >> %Name%\Project\src\main.cpp
    echo. >> %Name%\Project\src\main.cpp
    echo } >> %Name%\Project\src\main.cpp

    :: Remplissage par défaut Functions.cpp
    echo #include ^<iostream^> > %Name%\Project\src\Functions.cpp
    echo #include "../inc/Functions.hpp" >> %Name%\Project\src\Functions.cpp
    echo. >> %Name%\Project\src\Functions.cpp
    echo // Functions content >> %Name%\Project\src\Functions.cpp

    :: Message de succès
    echo [32mCPP files created successfully.[0m

    :: Création des fichiers .hpp
    echo.
    echo Creation of the header files...
        
    :: Création des fichiers .hpp
    echo. > %Name%\Project\inc\Functions.hpp

    :: Remplissage par défaut Functions.h
    echo #ifndef __FUNCTIONS__ > %Name%\Project\inc\Functions.hpp
    echo #define __FUNCTIONS__ >> %Name%\Project\inc\Functions.hpp
    echo. >> %Name%\Project\inc\Functions.hpp
    echo // Header content >> %Name%\Project\inc\Functions.hpp
    echo. >> %Name%\Project\inc\Functions.hpp
    echo #endif >> %Name%\Project\inc\Functions.hpp

    echo [32mHeader files created successfully.[0m
)

:: Creation of the build system file
if /i "%Want_Build_System%"=="y" (
    if /i "%Build_System%"=="Make" (
        echo.
        echo Creation of the MakeFile...
        
        :: MakeFile content depending of the langage used
        echo # Variables> %Name%\MakeFile

        if /i "%type%"=="cpp" (
            echo CXX = g++>> %Name%\MakeFile
        ) else (
            echo CXX = gcc>> %Name%\MakeFile
        )
        
        echo CXXFLAGS = -Wall -Wextra -I%Name%\Project\inc>> %Name%\MakeFile
        
        echo.>> %Name%\MakeFile
        echo # Directories>> %Name%\MakeFile
        echo SRC_DIR = Project\src>> %Name%\MakeFile
        echo INC_DIR = Project\inc>> %Name%\MakeFile
        echo BUILD_DIR = build>> %Name%\MakeFile
        echo BIN_DIR = bin>> %Name%\MakeFile
        
        echo.>> %Name%\MakeFile
        echo # Executable name>> %Name%\MakeFile
        echo TARGET = $^(BIN_DIR^)/main.exe>> %Name%\MakeFile
        
        echo.>> %Name%\MakeFile
        echo # Source files and objects>> %Name%\MakeFile
        echo SOURCES = $^(wildcard $^(SRC_DIR^)/*.cpp^)>> %Name%\MakeFile
        echo OBJECTS = $^(patsubst $^(SRC_DIR^)/%%.cpp, $^(BUILD_DIR^)/%%.o, $^(SOURCES^)^)>> %Name%\MakeFile
        
        echo.>> %Name%\MakeFile
        echo all: $^(TARGET^)>> %Name%\MakeFile
        
        echo.>> %Name%\MakeFile
        echo # Link objects and create executables>> %Name%\MakeFile
        echo $^(TARGET^): $^(OBJECTS^)>> %Name%\MakeFile
        echo 	@if not exist $^(BIN_DIR^) mkdir $^(BIN_DIR^)>> %Name%\MakeFile
        echo 	$^(CXX^) $^(OBJECTS^) -o $@>> %Name%\MakeFile
        echo 	@echo Linking complete : $@>> %Name%\MakeFile

        echo.>> %Name%\MakeFile
        echo # Compile .cpp to .o>> %Name%\MakeFile
        echo $^(BUILD_DIR^)/%%.o: $^(SRC_DIR^)/%%.cpp>> %Name%\MakeFile
        echo 	@if not exist $^(BUILD_DIR^) mkdir $^(BUILD_DIR^)>> %Name%\MakeFile
        echo 	$^(CXX^) $^(CXXFLAGS^) -c $^< -o $@>> %Name%\MakeFile
        echo 	@echo Compilation : $@>> %Name%\MakeFile

        echo.>> %Name%\MakeFile
        echo # Clean .o files>> %Name%\MakeFile
        echo clean:>> %Name%\MakeFile
        echo 	@if exist build\*.o del /Q build\*.o>> %Name%\MakeFile
        echo 	@if exist bin\*.exe del /Q bin\*.exe>> %Name%\MakeFile
        echo 	@echo Cleaning completed>> %Name%\MakeFile

    ) else (
        :: CMake content depending of the langage used
        echo.
        echo CMake build system isn't supported yet...
    )
)

:: Fin de création
echo.
echo [33mCREATION FINISHED[0m
pause