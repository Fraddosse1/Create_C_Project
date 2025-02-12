:: CCP script to generate a predefined structure for a C project
:: CCP = Create_C_Project.bat

@echo off

echo =======================================
echo           _____ _____ _____
echo          ^/ ____^/ ____^|  __ ^\ 
echo         ^| ^|   ^| ^|    ^| ^|__^) ^|
echo         ^| ^|   ^| ^|    ^|  ___^/ 
echo         ^| ^|___^| ^|____^| ^|     
echo          ^\_____^\_____^|_^|                          
echo =======================================
echo.

:: Input the name of the project
:NameProject
echo.
set /p Name=^> Enter the name of the project : 

:VerificationName
set /p Verification=^> Are you sure ? ^(Y/N^) : 
if /i "%Verification%" NEQ "y" (
    if /i "%Verification%" NEQ "n" (
        goto VerificationName 
    ) else (
        goto NameProject
    )
)

:: Input type of project (c/cpp)
:InputType
echo.
set /p type=^> Enter the type of project (c/cpp) : 

if /i "%type%" NEQ "c" if /i "%type%" NEQ "cpp" (
    echo.
    echo [31m^>^> Error: Invalid input. Please enter 'c' or 'cpp'.[0m
    goto InputType
)

:: Input the PATH of the project
:InputPath
echo.
set /p ProjectPath=^> Enter the path of the project : 

if "%ProjectPath%"=="" (
    echo.
    echo Your current directory has been set as your chosen path.
    set ProjectPath=%cd%
) else (
    :: Vérification si il s'agit d'un PATH valide
    if NOT EXIST "%ProjectPath%" (
        echo.
        echo [31m^>^> Error: Invalid input. Please enter a valid path.[0m
        goto InputPath
    )
)

:: Changement de la valeur de Verification
set Verification=""

:VerificationPath
set /p Verification=^> Are you sure ? ^(Y/N^) : 
echo %Verification%
if /i "%Verification%" NEQ "y" (
    if /i "%Verification%" NEQ "n" (
        goto VerificationPath 
    ) else (
        goto InputPath
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
    echo    printf^("Hello world"^); >> %Name%\Project\src\main.c
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
    echo    std::cout ^<^< "Hello world" ^<^< std::endl; >> %Name%\Project\src\main.cpp
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

:: Fin de création
echo.
echo [33mCREATION FINISHED[0m
pause