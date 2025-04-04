#!/bin/bash

BASE_DIR="output_apks"

# Check if base directory exists
if [ ! -d "$BASE_DIR" ]; then
  echo "❌ Error: Directory '$BASE_DIR' does not exist!"
  exit 1
fi

# Show package folders matching keyword or list all
if [ -z "$1" ]; then
  echo "No search keyword passed. Listing all extracted packages:"
  PACKAGES=$(find "$BASE_DIR" -maxdepth 1 -mindepth 1 -type d)
else
  echo "Searching for extracted packages containing '$1':"
  PACKAGES=$(find "$BASE_DIR" -maxdepth 1 -mindepth 1 -type d -iname "*$1*")
fi

# Check if any results were found
if [ -z "$PACKAGES" ]; then
  echo "❌ No extracted APK folders found matching criteria."
  exit 1
fi

# Show the list
echo "$PACKAGES" | sed "s|$BASE_DIR/||"

echo
read -p "Enter the exact package name to install: " PACKAGE_NAME

APK_DIR="$BASE_DIR/$PACKAGE_NAME"

if [ ! -d "$APK_DIR" ]; then
  echo "❌ Error: Folder '$APK_DIR' does not exist!"
  exit 1
fi

# Detect if connected device is an emulator
for device in $(adb devices | grep -w "device" | awk '{print $1}'); do
  EMULATOR_FLAG=$(adb -s "$device" shell getprop ro.kernel.qemu)

  if [[ "$EMULATOR_FLAG" == "1" ]]; then
    IS_EMULATOR=true
    echo "📱 $device → Emulator ✅"
  else
    IS_EMULATOR=false
    echo "📱 $device → Real Device ✅"
  fi
done

# Get APKs (filtered)
if [ "$IS_EMULATOR" = true ]; then
  echo "Including all .apk files (including x86_64 splits)..."
  APK_FILES=$(find "$APK_DIR" -type f -name "*.apk" | sort)
else
  echo "Excluding 'split_config.x86_64.apk' from install..."
  APK_FILES=$(find "$APK_DIR" -type f -name "*.apk" ! -name "split_config.x86_64.apk" | sort)
fi

if [ -z "$APK_FILES" ]; then
  echo "❌ No APK files found in $APK_DIR"
  exit 1
fi

echo
echo "Installing APKs from: $APK_DIR"
echo

# Convert newline-separated list to space-separated
APK_LIST=$(printf "%s " $APK_FILES)

adb install-multiple $APK_LIST

echo
echo "✅ Installation complete (if no errors above)."
