<!-- Guide for using helper scripts to automate APK extraction and installation -->

# ⚙️ Script Automation: Extract & Install APKs

These helper scripts simplify the process of working with apps installed on an Android device or emulator by automating:

- Extracting base + split APKs
- Installing APKs conditionally based on emulator/real device
- Filtering unsupported APKs like `x86_64` splits
- Avoiding manual typing for repeated commands

---

## 📁 Folder Assumption

Both extract and install scripts assume you are working with this structure:

```
output_apks/
├── com.example.app/
│   ├── base.apk
│   ├── split_config.en.apk
│   ├── split_config.xxhdpi.apk
│   └── split_config.x86_64.apk
```

> Folders like `com.example.app` are created per package after extraction.

---

## 📤 Extract APKs from Emulator

### 🐧 macOS/Linux: `extract_apk.sh`

#### 📦 What it does:
- Accepts optional keyword to filter installed packages
- Lists matching packages from the device
- Pulls all APKs for a selected package to `output_apks/<package>/`

#### 🔧 Usage:

```bash
chmod +x extract_apk.sh
./extract_apk.sh [search_keyword]
```

📥 [Download extract_apk.sh](https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/scripts/extract_apk.sh)

---

### 🪟 Windows: `extract_apk.bat`

#### 📦 What it does:
- Searches installed packages using an optional argument
- Prompts for package name
- Extracts APK files to `output_apks\<package>\`

#### 🔧 Usage:

```bat
extract_apk.bat [search_keyword]
```

📥 [Download extract_apk.bat](https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/scripts/extract_apk.bat)

---

## 📥 Install Extracted APKs

### 🐧 macOS/Linux: `install_apks.sh`

#### 📦 What it does:
- Lists or filters extracted APK folders
- Exits early if nothing is found
- Detects whether device is emulator or real
- Filters `split_config.x86_64.apk` if real device
- Installs using `adb install-multiple`

#### 🔧 Usage:

```bash
chmod +x install_apks.sh
./install_apks.sh [search_keyword]
```

📥 [Download install_apks.sh](https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/scripts/install_apks.sh)

---

### 🪟 Windows: `install_apks.bat`

#### 📦 What it does:
- Lists or filters extracted APK folders
- Stops early if none found
- Detects emulator vs real device
- Dynamically builds `adb install-multiple` command
- Filters `split_config.x86_64.apk` for real devices

#### 🔧 Usage:

```bat
install_apks.bat [search_keyword]
```

📥 [Download install_apks.bat](https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/scripts/install_apks.bat)

---

## ✅ Requirements

- ADB installed and available in your system `PATH`
- Emulator or real device connected
- `output_apks/` directory populated by the extract scripts
- Only one device connected when running install script

