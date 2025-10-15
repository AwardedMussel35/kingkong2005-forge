@echo off
REM Build script for Kong05 Forge 1.20.1
REM Requires Java 17. It will try to use Gradle Wrapper if found, else system Gradle.

where java >NUL 2>&1 || (echo [ERROR] Java not found in PATH. Install JDK 17 and retry.& exit /b 1)

for /f "tokens=2 delims==" %%v in ('java -XshowSettings:properties -version 2^>^&1 ^| findstr "java.specification.version"') do set JAVAV=%%v
echo Detected Java spec version:%JAVAV%

if exist gradlew.bat (
  echo Using Gradle Wrapper...
  call gradlew.bat --no-daemon build || exit /b 1
) else (
  echo No gradle wrapper found. Trying system gradle...
  gradle --no-daemon build || (
    echo [ERROR] Gradle not found. Install Gradle OR run: gradle wrapper  && then: gradlew.bat build
    exit /b 1
  )
)

echo.
echo Build complete. Check build\libs\ for the JAR.
pause