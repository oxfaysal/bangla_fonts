import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

/// A collection of popular Bangla fonts that can be loaded dynamically.
///
/// This class provides static methods and constants to access various Bangla fonts
/// like Kalpurush, Hind Siliguri, and more from a remote CDN. It handles 
/// downloading, local caching, and registering fonts within the Flutter engine.
class BanglaFonts {
  /// Private constructor to prevent instantiation.
  BanglaFonts._();

  /// Base URL for the Bangla Fonts CDN where the TTF files are hosted.
  static const String _baseUrl =
      "https://oxfaysal.github.io/bangla_fonts_cdn/fonts/";

  /// Constant identifier for the Adorsho Lipi font.
  static const String adorshoLipi = "adorsholipi";

  /// Constant identifier for the Kalpurush font.
  static const String kalpurush = "kalpurush";

  /// Constant identifier for the Li Adorno Irrit font.
  static const String liAdornoIrrit = "liadornoirrit";

  /// Constant identifier for the Mukti font.
  static const String mukti = "mukti";

  /// Constant identifier for the Nikosh font.
  static const String nikosh = "nikosh";

  /// Constant identifier for the Sagar font.
  static const String sagar = "sagar";

  /// Constant identifier for the Shadhinata font.
  static const String shadhinata = "shadhinata";

  /// Constant identifier for the Showpnocari font.
  static const String showpnocari = "showpnocari";

  /// Constant identifier for the Sylheti font.
  static const String sylheti = "sylheti";

  /// Constant identifier for the Siyam Rupali font.
  static const String siyamRupali = "siyamrupali";

  /// Constant identifier for the Anek Bangla font.
  static const String anekBangla = "anekbangla";

  /// Constant identifier for the Hind Siliguri font.
  static const String hindSiliguri = "hindsiliguri";

  /// Constant identifier for the Li Dorswadesh font.
  static const String liDorswadesh = "liadorswadesh";

  /// Constant identifier for the Li Dhakaia font.
  static const String liDhakaia = "lidhakaiyarrr";

  /// Constant identifier for the Li Liakote Kota font.
  static const String liLiakoteKota = "liliakotekota";

  /// Constant identifier for the Li Shamim Chitra font.
  static const String liShamimChitra = "lishamimchitranee";

  /// Constant identifier for the Li Ullash font.
  static const String liUllash = "liullashrrr";

  /// Constant identifier for the Mina font.
  static const String mina = "mina";

  /// Constant identifier for the Solaiman Lipi font.
  static const String solaimanLipi = "solaimanlipi";

  /// Constant identifier for the SutonnyOMJ font.
  static const String sutonnyOMJ = "sutonnyomj";

  /// Internal cache to track loaded fonts during the current application session.
  static final Set<String> _loadedFonts = {};

  /// Loads a specific Bangla font by its [fontName].
  ///
  /// The loading process follows these steps:
  /// 1. Checks if the font is already loaded in the current session.
  /// 2. Checks if the font file exists in the local application support directory.
  /// 3. If not found locally, it downloads the font from the predefined CDN.
  /// 4. Registers the font data with Flutter's [FontLoader].
  ///
  /// Returns [true] if the font is successfully loaded or already present, 
  /// and [false] if an error occurs during download or registration.
  static Future<bool> load(String fontName) async {
    // Check if the font is already loaded in this session to avoid redundant work.
    if (_loadedFonts.contains(fontName)) return true;

    try {
      // Get the application support directory for local storage.
      final directory = await getApplicationSupportDirectory();
      final file = File('${directory.path}/$fontName.ttf');

      // 1. Check if the font file already exists in local storage.
      if (!await file.exists()) {
        final String fontUrl = '$_baseUrl${fontName.toLowerCase()}.ttf';

        final response = await http.get(Uri.parse(fontUrl));

        if (response.statusCode == 200) {
          // Save the downloaded font bytes to local storage for future use.
          await file.writeAsBytes(response.bodyBytes);
        } else {
          // Failed to download from CDN.
          return false;
        }
      }

      // 2. Read the font file as bytes.
      final Uint8List fontData = await file.readAsBytes();

      // 3. Register the font within the Flutter engine.
      final fontLoader = FontLoader(fontName);
      fontLoader.addFont(Future.value(ByteData.view(fontData.buffer)));
      await fontLoader.load();

      // Mark as loaded in the current session.
      _loadedFonts.add(fontName);

      return true;
    } catch (e) {
      // Log the error or handle it silently.
      return false;
    }
  }

  /// Checks whether a specific [fontName] has already been downloaded 
  /// to the device's local storage.
  ///
  /// Returns [true] if the file exists, otherwise [false].
  static Future<bool> isDownloaded(String fontName) async {
    final directory = await getApplicationSupportDirectory();
    final file = File('${directory.path}/$fontName.ttf');
    return await file.exists();
  }
}