:: CCP script to generate a predefined structure for a C project
:: CCP = Create_C_Project.bat

@echo off

:: Vérification si un argument a été passé
if "%~1" == "" (
    echo Erreur : Veuillez passer un argument  
    EXIT /B
)

:: Vérification si il s'agit d'un PATH valide
if NOT EXIST "%~1" (
    echo Erreur : Veuillez passer un chemin valide comme argument
    EXIT /B
)

:: Début de création
echo DEBUT DE CREATION

:: Redirection vers le path indiqué
echo.
echo Redirection vers le PATH...
cd %~1

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

:: Création des fichiers .c
echo.
echo Creation des fichiers .c ...

:: Création des fichiers .c
echo. > Project_Name\Project\src\main.c
echo. > Project_Name\Project\src\Functions.c

:: Remplissage par défaut main.c
echo #include ^<stdio.h^> > Project_Name\Project\src\main.c
echo. >> Project_Name\Project\src\main.c
echo int main(){ >> Project_Name\Project\src\main.c
echo printf("Hello worlds"); >> Project_Name\Project\src\main.c
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
echo #define __FUNCTIOND__ >> Project_Name\Project\inc\Functions.h
echo. >> Project_Name\Project\inc\Functions.h
echo // Header content >> Project_Name\Project\inc\Functions.h
echo. >> Project_Name\Project\inc\Functions.h
echo #endif >> Project_Name\Project\inc\Functions.h

echo Fichiers .h cree avec succes.

:: Fin de création
echo.
echo FIN DE LA CREATION
pause