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


> *More fonts coming soon! Check the [Online Directory](https://oxfaysal.github.io/bangla_fonts_cdn/)*

## 🚀 Getting Started

### Installation
Add this to your `pubspec.yaml`:

```yaml
dependencies:
  bangla_fonts: ^1.0.0
```

### 1. Initialize & Load
It's recommended to load your primary font in the `main()` function to avoid layout shifts.

```dart
import 'package:bangla_fonts/bangla_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load font from CDN or Local Cache
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

### 🤝 Contributing
Found a `bug` or want to `add` a new font?

* Fork the Project.

* Create your Feature Branch (git checkout -b feature/NewFont).

* Commit your Changes (git commit -m 'Add NewFont').

* Push to the Branch (git push origin feature/NewFont).

* Open a Pull Request.




## 📧 Contact & Support

If you have any questions, feedback, or run into issues while using `bangla_fonts`, feel free to reach out:

* **Email:** [loomixdev@gmail.com](loomixdev@gmail.com)
* **GitHub:** [https://github.com/oxfaysal](https://github.com/oxfaysal)
* **Facebook:** [https://web.facebook.com/0xfaysal](https://web.facebook.com/0xfaysal)

I'm happy to help you with any improvements or fixes!


<br>

---

<p align="center">
  <b>Developed with ❤️ by LoomixDev</b><br>
  <i>Special thanks to <b>OmicronLab</b>, <b>Lipighor</b>, and other font creators for their amazing contributions to the Bangla community.</i> <br>
  <i><b> Credits & License:</b> All fonts in this package are the property of their respective creators (OmicronLab, Lipighor, etc.). This package only provides a way to load them dynamically for development and educational purposes. Please respect the license of each font for commercial use. </i>
</p>


