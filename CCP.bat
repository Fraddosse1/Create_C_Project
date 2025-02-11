:: CCP script to generate a predefined structure for a C project
:: CCP = Create_C_Project.bat

@echo off

echo WELCOME TO CPP !
echo.

:: Input type of project (c/cpp)
:InputType
echo.
set /p type=Enter the type of project (c/cpp): 

if /i "%type%" NEQ "c" if /i "%type%" NEQ "cpp" (
    echo.
    echo Invalid input. Please enter 'c' or 'cpp'.
    goto InputType
)

:: Input the PATH of the project
:InputPath
echo.
set /p path=Enter the path of the project :

if "%path%" == "" (
    echo.
    echo Erreur : Veuillez passer un chemin
    goto InputPath
) else (
    :: Vérification si il s'agit d'un PATH valide
    if NOT EXIST "%path%" (
        echo.
        echo Erreur : Veuillez passer un chemin valide
        goto InputPath
    )
)

:: Début de création
echo DEBUT DE CREATION

:: Redirection vers le path indiqué
echo.
echo Redirection vers le PATH...
cd %path%

:: Création des répertoires du projet
echo.
echo Creation des dossiers...
mkdir Project_Name^
    Project_Name\conf^
    Project_Name\bin^
    Project_Name\Project\src^
    Project_Name\Project\inc^
    Project_Name\Project\res

echo Dossiers cree avec succes.

echo %type%

if /i "%type%"=="c" (
    :: Création des fichiers .c
    echo.
    echo Creation des fichiers .c ...

    :: Création des fichiers .c
    echo. > Project_Name\Project\src\main.c
    echo. > Project_Name\Project\src\Functions.c    

    :: Remplissage par défaut main.c
    echo #include ^<stdio.h^> > Project_Name\Project\src\main.c
    echo. >> Project_Name\Project\src\main.c
    echo int main^(^) { >> Project_Name\Project\src\main.c
    echo. >> Project_Name\Project\src\main.c
    echo printf^("Hello world"^); >> Project_Name\Project\src\main.c
    echo. >> Project_Name\Project\src\main.c
    echo } >> Project_Name\Project\src\main.c

    :: Remplissage par défaut Functions.c
    echo #include ^<stdio.h^> > Project_Name\Project\src\Functions.c
    echo #include "../inc/Functions.h" >> Project_Name\Project\src\Functions.c
    echo. >> Project_Name\Project\src\Functions.c
    echo // Functions content >> Project_Name\Project\src\Functions.c

    :: Message de succès
    echo Fichiers .c cree avec succes.

    :: Création des fichiers .h
    echo.
    echo Creation des fichiers .h ...
        
    :: Création des fichiers .h
    echo. > Project_Name\Project\inc\Functions.h

    :: Remplissage par défaut Functions.h
    echo #ifndef __FUNCTIONS__ > Project_Name\Project\inc\Functions.h
    echo #define __FUNCTIONS__ >> Project_Name\Project\inc\Functions.h
    echo. >> Project_Name\Project\inc\Functions.h
    echo // Header content >> Project_Name\Project\inc\Functions.h
    echo. >> Project_Name\Project\inc\Functions.h
    echo #endif >> Project_Name\Project\inc\Functions.h

    echo Fichiers .h cree avec succes.
) else (
    :: Création des fichiers .cpp
    echo.
    echo Creation des fichiers .cpp ...

    :: Création des fichiers .cpp
    echo. > Project_Name\Project\src\main.cpp
    echo. > Project_Name\Project\src\Functions.cpp

    :: Remplissage par défaut main.cpp
    echo #include ^<iostream^> > Project_Name\Project\src\main.cpp
    echo. >> Project_Name\Project\src\main.cpp
    echo int main^(^) { >> Project_Name\Project\src\main.cpp
    echo. >> Project_Name\Project\src\main.cpp
    echo std::cout ^<^< "Hello world" ^<^< std::endl; >> Project_Name\Project\src\main.cpp
    echo. >> Project_Name\Project\src\main.cpp
    echo } >> Project_Name\Project\src\main.cpp

    :: Remplissage par défaut Functions.cpp
    echo #include ^<iostream^> > Project_Name\Project\src\Functions.cpp
    echo #include "../inc/Functions.hpp" >> Project_Name\Project\src\Functions.cpp
    echo. >> Project_Name\Project\src\Functions.cpp
    echo // Functions content >> Project_Name\Project\src\Functions.cpp

    :: Message de succès
    echo Fichiers .cpp cree avec succes.

    :: Création des fichiers .hpp
    echo.
    echo Creation des fichiers .hpp ...
        
    :: Création des fichiers .hpp
    echo. > Project_Name\Project\inc\Functions.hpp

    :: Remplissage par défaut Functions.h
    echo #ifndef __FUNCTIONS__ > Project_Name\Project\inc\Functions.hpp
    echo #define __FUNCTIONS__ >> Project_Name\Project\inc\Functions.hpp
    echo. >> Project_Name\Project\inc\Functions.hpp
    echo // Header content >> Project_Name\Project\inc\Functions.hpp
    echo. >> Project_Name\Project\inc\Functions.hpp
    echo #endif >> Project_Name\Project\inc\Functions.hpp

    echo Fichiers .hpp cree avec succes.
)

:: Fin de création
echo.
echo FIN DE LA CREATION
pause