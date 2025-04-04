<!-- Step 3: How to get APK paths from the installed package -->

# 📦 Step 3: Get the APK Paths

Use `adb shell pm path <package>` to list APK file locations.

---

```bash
adb shell pm path com.sample
```

Sample output:

```
package:/data/app/.../sample_base.apk  
package:/data/app/.../sample_en.apk  
package:/data/app/.../sample_lo.apk  
package:/data/app/.../sample_x86_64.apk  
package:/data/app/.../sample_xxhdpi.apk  
```

---

➡️ [Next → Step 4: Pull APKs](step-04-pull-apks.md)
