<!-- Guide for using helper scripts to automate APK extraction -->

# ⚙️ Script Automation: Extract APKs

Use these helper scripts to automate pulling split APKs from your Android emulator or device.  
They also help you **search for package names**, then **extract and save APK files** neatly into a folder.

---

## ✅ Requirements

- Emulator or Android device must be connected and running
- ADB must be working (`adb devices`)
- You must know or search the correct package name

---

## 🐧 macOS/Linux: `extract_apk.sh`

### 📦 What it does:
- Searches installed packages (optionally with a keyword)
- Prompts for a package name
- Pulls all `.apk` files into `output_apks/<package_name>/`

### 🔧 How to use:

```bash
chmod +x extract_apk.sh
./extract_apk.sh com.example
```

If no keyword is passed, it will list all packages.

📥 [Download extract_apk.sh](https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/scripts/extract_apk.sh)

---

## 🪟 Windows: `extract_apk.bat`

### 📦 What it does:
- Searches for packages using a keyword (optional argument)
- Prompts for a package name
- Pulls all `.apk` files into `output_apks\<package_name>\`

### 🔧 How to use:

```bat
extract_apk.bat com.example
```

If no keyword is passed, it lists all installed packages.

📥 [Download extract_apk.bat](https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/scripts/extract_apk.bat)

---

## 📁 Output

All extracted APK files will be saved in:

```
output_apks/<your.package.name>/
```

The folder will be created automatically in the same directory where you run the script.
