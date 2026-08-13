#!/usr/bin/env bash
# Auto-format a Java file after Claude writes or edits it.
# Receives the changed file path on stdin (piped from the hook).
# Exits 0 quietly for non-Java files or when no formatter is available,
# so it never blocks Claude's normal flow.
set -euo pipefail

read -r FILE || exit 0
[ -z "${FILE:-}" ] && exit 0
case "$FILE" in
  *.java) ;;
  *) exit 0 ;;
esac
[ -f "$FILE" ] || exit 0

# 1) Prefer a project-local Spotless target if the build defines one.
if [ -f "pom.xml" ] && grep -q "spotless-maven-plugin" pom.xml 2>/dev/null; then
  mvn -q spotless:apply >/dev/null 2>&1 && { echo "Formatted via Spotless (Maven): $FILE"; exit 0; }
fi
if [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
  if grep -rq "spotless" build.gradle build.gradle.kts 2>/dev/null; then
    ./gradlew -q spotlessApply >/dev/null 2>&1 && { echo "Formatted via Spotless (Gradle): $FILE"; exit 0; }
  fi
fi

# 2) Fall back to a standalone google-java-format jar if present on PATH.
if command -v google-java-format >/dev/null 2>&1; then
  google-java-format --replace "$FILE" && { echo "Formatted via google-java-format: $FILE"; exit 0; }
fi

# 3) No formatter available — do nothing, silently.
exit 0
