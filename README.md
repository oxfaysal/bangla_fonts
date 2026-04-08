# 🚀 Bangla Fonts

[![Pub Version](https://img.shields.io/pub/v/bangla_fonts?color=blue)](https://pub.dev/packages/bangla_fonts)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Bangla Fonts** is a lightweight Flutter package developed by **LoomixDev** that allows you to use popular Bangla fonts dynamically from a CDN. Save your app size by not bundling heavy `.ttf` files in assets!

## ✨ Features

- 📦 **Ultra Lightweight:** No need to bundle fonts in your APK/IPA.
- ⚡ **Dynamic Loading:** Downloads and registers fonts at runtime.
- 💾 **Smart Caching:** Automatically saves fonts locally after the first download.
- 🌐 **Reliable CDN:** Hosted on high-speed GitHub Pages.
- 🎯 **Easy to Use:** Just one line of code to load any font.


<br>

## 🖼️ Live Preview

> 🌐 **Live Demo:** Explore all fonts at [https://oxfaysal.github.io/bangla_fonts_cdn/](https://oxfaysal.github.io/bangla_fonts_cdn/)

<br>

## 🎨 Supported Fonts

| Font Name | Preview Text | Constant |
|:--- |:--- |:--- |
| **Kalpurush** | আমার সোনার বাংলা আমি তোমায় ভালোবাসি | `BanglaFonts.kalpurush` |
| **Shadhinata** | আমার সোনার বাংলা | `BanglaFonts.shadhinata` |
| **Siyam Rupali** | বাতাসে বহিছে প্রেম, নয়নে লাগিল নেশা | `BanglaFonts.siyamRupali` |
| **Nikosh** | বাংলা আমাদের অহংকার, বাংলা আমাদের ভাষা | `BanglaFonts.nikosh` |
| **Adorsho Lipi** | আদর্শ লিপি দিয়ে শুরু হোক আমাদের শিক্ষা | `BanglaFonts.adorshoLipi` |
| **Li Adorno Irrit** | সৃজনশীলতায় আসুক নতুন মাত্রা | `BanglaFonts.liAdornoIrrit` |
| **Mukti** | মুক্তির গানে জেগে উঠুক প্রাণ | `BanglaFonts.mukti` |
| **Sagar** | সাগর তীরের মিষ্টি হাওয়া গায়ে লাগে বেশ | `BanglaFonts.sagar` |
| **Showpnocari** | স্বপ্নের ডানায় ভর করে চলি অজানায় | `BanglaFonts.showpnocari` |
| **Sylheti** | সিলেটি ভাষার মায়ায় জড়ানো জীবন | `BanglaFonts.sylheti` |
| **Anek Bangla** | আধুনিক বাংলার নতুন এক রূপ | `BanglaFonts.anekBangla` |
| **Hind Siliguri** | প্রযুক্তি ও বাংলা ভাষার মেলবন্ধন | `BanglaFonts.hindSiliguri` |
| **Mina** | সহজে পড়ার যোগ্য সুন্দর মিনা ফন্ট | `BanglaFonts.mina` |
| **SolaimanLipi** | নির্ভুল ও পরিচ্ছন্ন অক্ষরের ছোঁয়া | `BanglaFonts.solaimanLipi` |
| **Li Dhakaia** | পুরান ঢাকার ঐতিহ্যে ঘেরা ফন্ট | `BanglaFonts.liDhakaia` |
| **Li Dorswadesh** | নিজের দেশের মাটির ঘ্রাণে ভরা | `BanglaFonts.liDorswadesh` |
| **Li Liakote Kota** | নান্দনিক অক্ষর আর শৈল্পিক টান | `BanglaFonts.liLiakoteKota` |
| **Li Shamim Chitra** | চিত্রালী মায়ার এক অপূর্ব প্রকাশ | `BanglaFonts.liShamimChitra` |
| **Li Ullash** | নতুন দিনের নতুন উল্লাস | `BanglaFonts.liUllash` |
| **SuTonnyOMJ** | চিরচেনা বিজয় কিবোর্ডের প্রিয় ফন্ট | `BanglaFonts.sutonnyOMJ` |

<br>

## 🚀 Getting Started

### Installation
Add this to your `pubspec.yaml`:

```yaml
dependencies:
  bangla_fonts: ^1.1.0
```

### 1. Initialize & Load
It's recommended to load your primary font in the `main()` function to avoid layout shifts.

```dart
import 'package:bangla_fonts/bangla_fonts.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  // [Optional] Pre-load a specific font at app startup
  // This prevents the font from "flicking" when it's first displayed.
  await BanglaFonts.load(BanglaFonts.kalpurush);

  runApp(const MyApp());
}
```


### 2. Apply in UI
Simply use the font name in your `TextStyle`.

```dart
Text(
  "আমার সোনার বাংলা",
  style: TextStyle(
    fontFamily: BanglaFonts.kalpurush,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  ),
)
```

<br>

## 🛠️ Troubleshooting
If the fonts are not loading or displaying correctly, please check the following:

* **Internet Connection:** Since the fonts are loaded dynamically from a CDN, an active internet connection is required for the first-time load. Once loaded, they are cached locally for offline use.

* **Ensure Initialization:** If you are pre-loading fonts in `main()`, make sure you have called `WidgetsFlutterBinding.ensureInitialized();` before calling `BanglaFonts.load()`.

* **HTTP Permissions:** 
  1. **Android:** Ensure you have added internet permission in your `AndroidManifest.xml`:
    ```xml
      <uses-permission android:name="android.permission.INTERNET" />
    ```
  2. **macOS:** If you are testing on macOS, enable network access in `DebugProfile.entitlements` and `Release.entitlements`.

* **Font Family Name:** Double-check that you are using the constants from the `BanglaFonts` class (e.g., `BanglaFonts.kalpurush`) instead of typing the string manually to avoid typos.

* **Clean Build:** Sometimes Flutter's cache can cause issues. Try running:
```Bash
  flutter clean
  flutter pub get
```

<br>



## 🤝 Contributing
Found a `bug` or want to `add` a new font?

* Fork the Project.

* Create your Feature Branch (git checkout -b feature/NewFont).

* Commit your Changes (git commit -m 'Add NewFont').

* Push to the Branch (git push origin feature/NewFont).

* Open a Pull Request.


<br>

## 📧 Contact & Support

If you have any questions, feedback, or run into issues while using `bangla_fonts`, feel free to reach out:

* **Email:** [loomixdev@gmail.com](loomixdev@gmail.com)
* **GitHub:** [https://github.com/oxfaysal](https://github.com/oxfaysal)
* **Facebook:** [https://web.facebook.com/0xfaysal](https://web.facebook.com/0xfaysal)

I'm happy to help you with any improvements or fixes!


<br>

---

<p align="center">
  <img src="https://img.shields.io/badge/Developed%20with-❤️-black?style=for-the-badge" alt="Developed with love">
  <br>
  <b>Maintained by <a href="https://github.com/oxfaysal">Faysal (LoomixDev)</a></b>
</p>

<br>

> [!IMPORTANT]  
> **Acknowledgments & Credits:** > Heartfelt thanks to **OmicronLab**, **Lipighor**, and all the talented font creators for their incredible contributions to the Bangla typography ecosystem. 

> [!CAUTION]  
> **License & Disclaimer:** > All fonts included/linked in this package are the intellectual property of their respective creators. This package is intended for development and educational purposes. Please ensure you comply with the specific license of each font for commercial use.


