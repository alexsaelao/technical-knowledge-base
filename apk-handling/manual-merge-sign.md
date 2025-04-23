<!-- Guide for manually merging, signing, and installing APKs -->

# 🔧 Manual Merge & Sign Split APKs

- Ensure **Java** is installed and available in your system `PATH`
- Ensure `keytool` and `apksigner` are available (bundled with Android SDK `build-tools`) and in `PATH`
- APKEditor ([Download APKEditor](https://github.com/REAndroid/APKEditor))
- A folder of extracted **split APKs** (base + splits)
- APK file generated from the merge process, ready to sign


---

This guide helps you manually handle extracted APKs by:

- Merging or modifying APK content (optional)
- Signing the merged APK using a keystore
- Verifying the APK signature
- Installing the signed APK on your emulator or device

---

## 🛠️ Typical Use Case

You may want to do this if:

- You're testing a modified or rebuilt APK
- You’ve edited the Smali code or resource files
- You need to bypass emulator-specific restrictions

---

## 📦 Merge & Sign Workflow

### ✅ Step 1: Merge APK with APKEditor

> 📁 **Note:** Ensure the split APK files are located in the correct folder and the path provided in the command points to that folder accurately.

Use APKEditor to rebuild or repack modified content:

```bash
java -jar APKEditor-1.4.2.jar m -i C:\Users\Advice\Desktop\apk\install\output_apks\com.sample.app
```

> 🔗 Download APKEditor: [https://github.com/REAndroid/APKEditor](https://github.com/REAndroid/APKEditor)

---

### ✅ Step 2: Generate a Keystore

Only needs to be done once:

```bash
keytool -genkey -v -keystore custom.keystore -alias mykeyaliasname -keyalg RSA -keysize 2048 -validity 10000
```

This will prompt you to set passwords and information for the key.

---

### ✅ Step 3: Sign the Merged APK

Use the keystore created in Step 1:

```bash
apksigner sign --ks-key-alias mykeyaliasname --ks custom.keystore com.sample.app_merged.apk
```

---

### ✅ Step 4: Verify the Signed APK

Ensure the signature is valid before installation:

```bash
apksigner verify com.sample.app_merged.apk
```

---


### ✅ Step 5: Install the APK

Use ADB to install your signed APK:

```bash
adb install com.sample.app_merged.apk
```

---
