<!-- Step 3: How to get APK paths from the installed package -->

# 📦 Step 3: Get the APK Paths

Use `adb shell pm path <package>` to list APK file locations.

---

```bash
adb shell pm path com.jdb.mbanking
```

Sample output:

```
package:/data/app/.../jdb_base.apk  
package:/data/app/.../jdb_en.apk  
package:/data/app/.../jdb_lo.apk  
package:/data/app/.../jdb_x86_64.apk  
package:/data/app/.../jdb_xxhdpi.apk  
```