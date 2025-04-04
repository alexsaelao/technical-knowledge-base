#!/bin/bash

# If a keyword is passed, search packages with it
if [ -z "$1" ]; then
  echo "No search keyword passed. Listing all packages..."
  adb shell pm list packages
else
  echo "Searching for packages containing '$1'..."
  adb shell pm list packages | grep "$1"
fi

echo
read -p "Enter the exact package name you want to pull APKs from: " PACKAGE_NAME

# Create output folder: output_apks/<package_name>
OUTPUT_DIR="output_apks/$PACKAGE_NAME"
mkdir -p "$OUTPUT_DIR"

echo
echo "Fetching APK paths for $PACKAGE_NAME..."
echo "Saving files to $OUTPUT_DIR"
echo

# Get all apk paths and pull them to the output directory
adb shell pm path "$PACKAGE_NAME" | sed 's/package://g' | while read -r APK_PATH; do
  FILENAME=$(basename "$APK_PATH")
  echo "Pulling: $APK_PATH → $OUTPUT_DIR/$FILENAME"
  adb pull "$APK_PATH" "$OUTPUT_DIR/$FILENAME"
done

echo
echo "Done! APKs saved in $OUTPUT_DIR"
