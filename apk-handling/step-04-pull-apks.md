<!-- Step 3: How to extract/pull APK files from emulator -->

# 📥 Step 3: Pull APK Files

Use `adb pull` to copy APK files from emulator to your PC.

---

### 1. Create a Folder

- **Windows**: `C:\Users\Advice\Desktop\apk`  
- **macOS**: `~/Desktop/apk`

### 2. Pull APKs One-by-One

**Windows Example**:
```bash
adb pull /data/app/.../jdb_base.apk C:\Users\Advice\Desktop\apk\jdb_base.apk
```

**macOS Example**:
```bash
adb pull /data/app/.../jdb_base.apk ~/Desktop/apk/jdb_base.apk
```

Repeat for all APKs.

---

➡️ [Next → Step 5: Install APKs](step-05-install.md)
