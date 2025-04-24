# 🛠️ Reverse Engineer: Smali Edits & Rebuild APK

This guide walks you through decompiling an APK, modifying its Smali code, and rebuilding + re-signing it for testing, debugging, or bypassing protections.

---

## 🧰 Requirements

- APKTool ([Download here](https://apktool.org/))
- Java installed and in your system `PATH`
- APK file
- VS Code Extensions:

  - [Smalise](https://marketplace.visualstudio.com/items?itemName=LoyieKing.smalise)
  - [Smali2Java](https://marketplace.visualstudio.com/items?itemName=ooooonly.smali2java)
  - [APKLab](https://marketplace.visualstudio.com/items?itemName=Surendrajat.apklab)
  - Ensure `JADX` path is set in VS Code settings:
    - **Windows**: `C:\Users\<YourUsername>\.apklab\jadx-1.4.7`
    - **macOS**: `/Users/<YourUsername>/.apklab/jadx-1.4.7`
    - **Note**: If not available, download from [JADX Releases](https://github.com/skylot/jadx/releases) and configure the path in VS Code settings

---

## 🖥️ Decode the APK and Edit Smali Code Using VS Code

### 🗂️ Step 1: Open APK with APKLab in VS Code
To begin working with your APK using APKLab in VS Code:
- Open VS Code
- Open command palette:  
   - **Windows**: `Ctrl + Shift + P`  
   - **macOS**: `Cmd + Shift + P`
- Type and select `APKLab: Open an APK`
- Choose the `.apk` file
- ✅ Tick the box `--only-main-classes`
- Click OK to decompile

<div style="display: flex; justify-content: center; align-items: center; gap: 30px; margin: 0 auto;">
    <img src="https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/reverse-smali-rebuild/step1.0.png" alt="QR Code with Logo" width="400">
    <img src="https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/reverse-smali-rebuild/step1.1.png" alt="QR Code without Logo" width="400">
</div>

---

### ✏️ Step 2: Edit Smali Code Using VS Code

Once APKLab has decompiled the APK:

- Navigate to the `smali/` directory
- Locate files such as:
  - `RootBeer.smali`
  - `EmulatorCheck.smali`
  - Any custom protection classes
- You can:
  - **Edit** `.smali` code directly
  - **Bypass root detection** (e.g. `RootBeer`, `isEmulator`, `Jailbreak`)
  - Use **Smali2Java** to convert `.smali` into readable Java code
  - Use **Smalise** for syntax highlighting and structure

> 🛡️ Tip: Comment out or modify method return values to bypass checks

---

### 🧱 Step 3: Rebuild the APK

Once your Smali modifications are complete:

- In the root of the decompiled project, find and **right-click** on `apktool.yml`
- Select `APKLab: Rebuild the APK`
- ✅ Tick the option `--use-aapt2`
- Click **OK** to begin the rebuild

> 🛠️ APKLab will compile all resources and Smali code into a new APK in the `dist/` folder.

<div style="display: flex; justify-content: center; align-items: center; gap: 30px; margin: 0 auto;">
    <img src="https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/reverse-smali-rebuild/step3.0.png" alt="QR Code with Logo" width="400">
    <img src="https://raw.githubusercontent.com/alexsaelao/technical-knowledge-base/main/apk-handling/reverse-smali-rebuild/step3.1.png" alt="QR Code without Logo" width="400">
</div>

---
