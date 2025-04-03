<!-- Common issues and solutions related to APK extraction and installation -->

# 🧯 Troubleshooting

Common issues and fixes when dealing with split APKs.

---

## 🔧 Common Errors

| Problem                            | Solution |
|------------------------------------|----------|
| `adb: command not found`           | Use full path to `adb` or navigate to `platform-tools` |
| `INSTALL_FAILED` or version error  | APKs must all be from the same app/version |
| `No such file or directory`        | Check file names and folder path carefully |

---

## ❌ INSTALL_FAILED_MISSING_SPLIT

```sh
adb: failed to finalize session
Failure [INSTALL_FAILED_MISSING_SPLIT: Missing split for com.jdb.mbanking]
```

### ✅ Cause:
You are missing at least one required split APK during installation.

### ✅ Solution:
Use `adb install-multiple` and make sure you include **all required APKs** (base + split).

**Example:**
```sh
adb install-multiple jdb_base.apk jdb_en.apk jdb_lo.apk jdb_xxhdpi.apk jdb_x86_64.apk
```
