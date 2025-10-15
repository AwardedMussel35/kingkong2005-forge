#!/usr/bin/env bash
set -euo pipefail

echo "[*] Building Kong05 Forge 1.20.1"
if ! command -v java >/dev/null 2>&1; then
  echo "[ERROR] Java not found in PATH. Install JDK 17."
  exit 1
fi

if [[ -f "./gradlew" ]]; then
  echo "[*] Using Gradle Wrapper"
  ./gradlew --no-daemon build
else
  echo "[*] No wrapper. Trying system Gradle"
  if command -v gradle >/dev/null 2>&1; then
    gradle --no-daemon build
  else
    echo "[ERROR] Gradle not found. Install Gradle OR run: gradle wrapper && then: ./gradlew build"
    exit 1
  fi
fi

echo "[*] Done. See build/libs/ for the JAR."