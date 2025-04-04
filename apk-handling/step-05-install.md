<!-- Step 5: How to reinstall all APKs using adb install-multiple -->

# 📲 Step 5: Reinstall the APKs

Use `adb install-multiple` to reinstall all split APKs.

---

### ✅ Option 1: Run From Inside APK Folder

**Step 1 – Change directory**

**Windows**:
```bash
cd C:\Users\Advice\Desktop\apk
```

**macOS/Linux**:
```bash
cd ~/Desktop/apk
```

**Step 2 – Run install-multiple**
```bash
adb install-multiple sample_en.apk sample_lo.apk sample_xxhdpi.apk sample_x86_64.apk sample_base.apk
```

---

### ✅ Option 2: Run ADB from platform-tools Directory with Full Paths

> Use this if `adb` is not added to your system's environment PATH.

**Windows**:
```bash
cd C:\Users\<YourUsername>\AppData\Local\Android\Sdk\platform-tools
adb install-multiple C:\Users\Advice\Desktop\apk\sample_en.apk C:\Users\Advice\Desktop\apk\sample_lo.apk C:\Users\Advice\Desktop\apk\sample_xxhdpi.apk C:\Users\Advice\Desktop\apk\sample_x86_64.apk C:\Users\Advice\Desktop\apk\sample_base.apk
```

**macOS/Linux**:
```bash
cd ~/Library/Android/sdk/platform-tools
adb install-multiple ~/Desktop/apk/sample_en.apk ~/Desktop/apk/sample_lo.apk ~/Desktop/apk/sample_xxhdpi.apk ~/Desktop/apk/sample_x86_64.apk ~/Desktop/apk/sample_base.apk
```

---

## ✅ Result

You’ll see:

```
Performing Streamed Install  
Success  
```

App will appear on the emulator 🎉

---

➡️ [Next → Troubleshooting](troubleshooting.md)
