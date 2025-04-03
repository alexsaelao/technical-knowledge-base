<!-- Step 4: How to reinstall all APKs using adb install-multiple -->

# 📲 Step 4: Reinstall the APKs

Use `adb install-multiple` to reinstall all split APKs.

---

### ✅ Option 1: Run From Inside APK Folder

**Step 1 – Change directory**

**Windows**:
```bash
cd C:\Users\Advice\Desktop\apk
```

**macOS**:
```bash
cd ~/Desktop/apk
```

**Step 2 – Run install-multiple**
```bash
adb install-multiple jdb_en.apk jdb_lo.apk jdb_xxhdpi.apk jdb_x86_64.apk jdb_base.apk
```

---

### ✅ Option 2: Run ADB from platform-tools Directory with Full Paths

> Use this if `adb` is not added to your system's environment PATH.

**Windows**:
```bash
cd C:\Users\<YourUsername>\AppData\Local\Android\Sdk\platform-tools
adb install-multiple C:\Users\Advice\Desktop\apk\jdb_en.apk C:\Users\Advice\Desktop\apk\jdb_lo.apk C:\Users\Advice\Desktop\apk\jdb_xxhdpi.apk C:\Users\Advice\Desktop\apk\jdb_x86_64.apk C:\Users\Advice\Desktop\apk\jdb_base.apk
```

**macOS**:
```bash
cd ~/Library/Android/sdk/platform-tools
adb install-multiple ~/Desktop/apk/jdb_en.apk ~/Desktop/apk/jdb_lo.apk ~/Desktop/apk/jdb_xxhdpi.apk ~/Desktop/apk/jdb_x86_64.apk ~/Desktop/apk/jdb_base.apk
```

---

## ✅ Result

You’ll see:

```
Performing Streamed Install  
Success  
```

App will appear on the emulator 🎉
