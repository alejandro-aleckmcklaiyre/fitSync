@echo off
set PATH_TO_FX="C:\Users\janka\Documents\Academe\OOP\javafx\openjfx-24.0.1_windows-x64_bin-sdk\javafx-sdk-24.0.1\lib"

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

:: Compile main source files
javac -d bin --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml src/FitSync/*.java src/controllers/*.java

:: Compile test files
javac -d bin --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml -cp bin src/test/java/FitSync/Question8Test.java

:: Run the test application
java --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml --enable-native-access=javafx.graphics --enable-preview -cp bin test.java.FitSync.Question8Test
pause 