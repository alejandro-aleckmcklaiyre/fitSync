@echo off
set PATH_TO_FX="C:\Users\janka\Documents\Academe\OOP\javafx\openjfx-24.0.1_windows-x64_bin-sdk\javafx-sdk-24.0.1\lib"

:: Get the test name from command line argument
set TEST_INPUT=%1
if "%TEST_INPUT%"=="" set TEST_INPUT=_8

:: Remove underscore if present
set TEST_NAME=%TEST_INPUT:_=%

:: Create bin directory structure
if not exist "bin" mkdir bin
if not exist "bin\FitSync" mkdir bin\FitSync
if not exist "bin\controllers" mkdir bin\controllers
if not exist "bin\fxml" mkdir bin\fxml
if not exist "bin\test\java\FitSync" mkdir bin\test\java\FitSync

:: Clean old compiled files
del /Q bin\FitSync\*.class
del /Q bin\controllers\*.class
del /Q bin\test\java\FitSync\*.class

:: Copy FXML files to bin directory
xcopy /y /s src\fxml\*.fxml bin\fxml\

:: Compile main source files first (they are dependencies)
javac -d bin --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml src/FitSync/*.java src/controllers/*.java

:: Check if it's a numbered test
echo %TEST_NAME% | findstr /r "^[0-9][0-9]*$" > nul
if errorlevel 1 (
    :: Named test (like Create, Profile, etc.)
    javac -d bin --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml -cp bin src/test/java/FitSync/%TEST_NAME%Test.java
    java --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml --enable-native-access=javafx.graphics --enable-preview -cp bin test.java.FitSync.%TEST_NAME%Test
) else (
    :: Numbered test (like Question8)
    javac -d bin --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml -cp bin src/test/java/FitSync/Question%TEST_NAME%Test.java
    java --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml --enable-native-access=javafx.graphics --enable-preview -cp bin test.java.FitSync.Question%TEST_NAME%Test
)
pause 