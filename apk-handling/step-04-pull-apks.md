<!-- Step 4: How to extract/pull APK files from emulator -->

# 📥 Step 4: Pull APK Files

Use `adb pull` to copy APK files from emulator to your PC.

---

### 1. Create a Folder

- **Windows**: `C:\Users\Advice\Desktop\apk`  
- **macOS/Linux**: `~/Desktop/apk`

### 2. Pull APKs One-by-One

**Windows Example**:
```bash
adb pull /data/app/.../sample_base.apk C:\Users\Advice\Desktop\apk\sample_base.apk
```

**macOS/Linux Example**:
```bash
adb pull /data/app/.../sample_base.apk ~/Desktop/apk/sample_base.apk
```

Repeat for all APKs.

---

➡️ [Next → Step 5: Install APKs](step-05-install.md)
