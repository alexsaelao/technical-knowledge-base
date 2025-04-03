<!-- Step 2: How to find the app’s package name using ADB -->

# 🔍 Step 2: Find the App’s Package Name

Instructions to list installed packages and filter by keyword.

---

### 1. Open Terminal

- **Windows**:  
  Press `Win + R` → type `cmd` → Enter  
  or use Android Studio > Terminal

- **macOS**:  
  Press `Cmd + Space` → type `Terminal` → Enter  
  or use Android Studio > Terminal

### 2. Navigate to platform-tools Folder

**Windows**:
```bash
cd C:\Users\<YourUsername>\AppData\Local\Android\Sdk\platform-tools
```

**macOS**:
```bash
cd ~/Library/Android/sdk/platform-tools
```

### 3. List All Installed Packages

```bash
adb shell pm list packages
```

### 4. Filter by Keyword (Optional)

**Windows**:
```bash
adb shell pm list packages | findstr jdb
```

**macOS**:
```bash
adb shell pm list packages | grep jdb
```