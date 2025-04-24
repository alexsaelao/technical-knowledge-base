# 🌐 Intercept API Traffic using HTTP Toolkit (Emulator without Google Play)

This guide walks you through intercepting API traffic from an Android application using HTTP Toolkit on a **rooted emulator without Google Play Store**, including certificate installation and bypassing SSL pinning protections.

---

## 🧰 Requirements

- HTTP Toolkit ([Download HTTP Toolkit](https://httptoolkit.com/))
- Create and run an emulator (image **without Google Play**)
- Ensure `adb` is installed and running properly
- The target application is already installed in the emulator

---

## 🚀 Step 1: Start Emulator

- Launch your Android emulator (no Google Play version)
- Ensure the emulator is **rooted** and has system write access:
  
```bash
adb root
adb remount
```

> 💡 Use an x86_64 or arm64 image for best compatibility with rooted commands

---

## 🔧 Step 2: Install Certificate for HTTP Toolkit

- Start **HTTP Toolkit** on your machine
- On your emulator, open `http://intercept.dev` to begin the cert installation flow

Since the emulator does not support user-trusted certificates without Play Store, follow these steps to install the cert **system-wide**:

```bash
adb push ~/Downloads/HTTP\ Toolkit\ Certificate.crt /sdcard/
adb shell
su
mount -o remount,rw /system
cp /sdcard/HTTP\ Toolkit\ Certificate.crt /system/etc/security/cacerts/
chmod 644 /system/etc/security/cacerts/HTTP\ Toolkit\ Certificate.crt
reboot
```

> ⚠️ Reboot the emulator after placing the cert in the system folder

---

## 📡 Step 3: Launch App & Intercept API Traffic

- Open your target app in the emulator
- You should now see the intercepted HTTP/HTTPS traffic in HTTP Toolkit, including:
  - URLs
  - Request/response headers
  - Payloads (JSON, form data, etc.)
  - Cookies & tokens

> ✅ You can pause, modify, replay, or forward requests directly in HTTP Toolkit

---

## 🔐 Step 4: (Optional) Bypass SSL Pinning

Some apps use SSL pinning to block custom certificates. If you're not seeing traffic, use one of the following:

### 🔧 Option A: Frida Script

Use Frida with `frida-android-unpinning.js`:

```bash
frida -U -n com.example.app -l frida-android-unpinning.js
```

### 🛠️ Option B: Smali Patching

- Use APKLab to decompile the app
- Find methods like:
  - `checkClientTrusted`
  - `verifyCertificateChain`
  - `HostnameVerifier`
- Patch or override the logic to **always return true** or **skip the check**

---

## 🌐 Extra: Capture WebView Traffic

If the app uses WebView:

```bash
adb shell setprop debug.webview.devtools_remote 1
```

> Then use Chrome's `chrome://inspect` or HTTP Toolkit to capture WebView requests.

---
