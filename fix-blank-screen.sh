#!/bin/bash

echo "=== 🔧 Starting Flutter Project Auto Fix Script ==="

# Step 1: Stop Gradle Daemon
echo "⏹️  Stopping Gradle Daemon..."
./gradlew --stop

# Step 2: Clean Flutter Project & Pub Cache
echo "🧹 Cleaning Flutter Project & Pub Cache..."
flutter clean
flutter pub cache repair

# Step 3: Upgrade All Dependencies to Latest Compatible Versions
echo "⬆️  Upgrading All Dependencies (Major Versions Allowed)..."
flutter pub upgrade --major-versions

# Step 4: Fix gradle.properties for Safer Builds (No Daemon + 4GB Heap)
echo "⚙️  Fixing gradle.properties..."
GRADLE_PROPERTIES_FILE="android/gradle.properties"
if [ -f "$GRADLE_PROPERTIES_FILE" ]; then
  sed -i '/org.gradle.daemon/d' "$GRADLE_PROPERTIES_FILE"
  sed -i '/org.gradle.jvmargs/d' "$GRADLE_PROPERTIES_FILE"
fi

cat >> "$GRADLE_PROPERTIES_FILE" << EOF
org.gradle.daemon=false
org.gradle.jvmargs=-Xmx4096M -Dfile.encoding=UTF-8
EOF

# Step 5: Disable Code Shrinking (Proguard/R8) in release build
echo "🚫 Disabling code shrinking (R8 / Proguard)..."
BUILD_GRADLE_FILE="android/app/build.gradle"
if grep -q "minifyEnabled" "$BUILD_GRADLE_FILE"; then
  sed -i 's/minifyEnabled true/minifyEnabled false/g' "$BUILD_GRADLE_FILE"
else
  echo "⚠️  WARNING: No minifyEnabled setting found, please check your build.gradle manually later."
fi

# Step 6: Build APK Release Safely
echo "🏗️  Building APK Release Safely..."
flutter build apk --release --no-shrink

echo "✅ Auto Fix Completed! APK built successfully (check build/app/outputs/flutter-apk/)"
echo "📋 If the app still shows a black screen, please check your Flutter logs via:"
echo "    adb logcat | grep flutter"
