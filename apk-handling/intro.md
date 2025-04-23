<!-- Introduction to APK Extraction & Installation section -->

# 📦 APK Extraction & Installation Guide

This section walks you through how to extract an app installed on your Android emulator (like from the Play Store) and reinstall it properly—even if it uses modern **Split APKs**.

---

## 📱 Complete Guide: Extract and Install Split APKs from Android Emulator
> ✅ Supports both **Windows** and **macOS/Linux**

---

### 📋 Steps Overview

- [Step 1: Prerequisites](step-01-prerequisites.md)  
  Set up your tools and environment before starting.

- [Step 2: Find Package Name](step-02-find-package.md)  
  Learn how to list all apps and identify the package name of the installed app.

- [Step 3: Get APK Paths](step-03-get-apk-paths.md)  
  Use `adb` to get the paths of all APK files (base + split) for the target app.

- [Step 4: Pull APKs](step-04-pull-apks.md)  
  Extract those APKs from the emulator and save them to your computer.

- [Step 5: Install APKs](step-05-install.md)  
  Reinstall all APK files (split APKs) correctly using `adb install-multiple`.

- [🚑 Troubleshooting](troubleshooting.md)  
  Solutions for common issues like missing files, install errors, or `adb` problems.

---

## ⚙️ Extras

- [Script Automation: Extract & Install Split APKs](scripts.md)  
  Use `.sh` and `.bat` files to automate pulling APKs from the emulator and Install extracted split APKs automatically with device-type filtering and support for both platforms.

- [Manual Merge & Sign Split APKs](manual-merge-sign.md)  
  Step-by-step instructions to manually merge split APKs, sign them with a keystore, and install to your emulator or device.
  
- [Reverse Engineer: Smali Edits & Rebuild APK](reverse-smali-rebuild.md)  
  Learn how to decompile APKs, modify Smali code, and rebuild + re-sign the APK for testing or patching.