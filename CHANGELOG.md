## 1.1.0
* **Universal Web Support**: Major update to support Flutter Web! The package now intelligently detects the platform and handles font loading without crashing on browsers.

* **Platform-Aware Logic**: Added kIsWeb checks to bypass local file system calls (path_provider) when running on web.

* **Improved Stability**: Refactored _fetchFromStorageOrNetwork with conditional logic and io prefixes to ensure 100% stability on Android, iOS, and Desktop.

* **Performance Boost**: Optimized font registration using ByteData.view for faster memory handling.

* **Refined Documentation**: Updated comments and credits to reflect LoomixDev branding and cross-platform capabilities.



## 1.0.2

* **API Documentation**: Added comprehensive dartdoc comments for all public classes and members to reach 100% pub points.
* **Code Quality**: Added private constructor to `BanglaFonts` to prevent unnecessary instantiation.
* **Improved Constants**: Refined class constants for better developer experience and IDE autocomplete.
* **Internal Optimizations**: Minor bug fixes in the font loading logic to ensure smoother rendering on slow connections.


## 1.0.1

* **Major Font Library Expansion**: Added 10 new popular Bangla fonts including Google Fonts (Mina, Hind Siliguri, Anek Bangla) and Lipighor favorites.
* **Total Font Support**: Now supports 20+ distinct Bangla fonts dynamically.
* **Improved Constants**: Refined `BanglaFonts` class constants for better developer experience and IDE autocomplete.
* **Enhanced Documentation**: Updated README with a detailed supported fonts table and proper credits for font creators.
* **Internal Optimizations**: Minor bug fixes in the font loading logic to ensure smoother rendering on slow connections.


## 1.0.0

* **Initial Release** of `bangla_fonts`.
* Support for dynamic loading of popular Bangla fonts (Kalpurush, Shadhinata, etc.).
* Automated font caching system to save data and improve performance.
* Run-time font registration using `FontLoader`.
* Minimalist and efficient CDN integration for fast delivery.
* Documentation and usage guide included.