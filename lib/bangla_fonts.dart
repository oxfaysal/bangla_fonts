import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

/// [dart_io] alias is used to prevent naming conflicts with 'dart:html' on Web.
import 'dart:io' as dart_io; 
import 'package:path_provider/path_provider.dart';

/// A collection of popular Bangla fonts that can be loaded dynamically.
/// 
/// Developed by LoomixDev | Faysal.
/// 
/// This class provides static methods to access various Bangla fonts
/// from a remote CDN. It handles:
/// * **Web:** Downloading and registering directly in memory.
/// * **Native (Mobile/Desktop):** Local caching using [path_provider] and [dart_io].
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
  /// The loading process:
  /// 1. Check if the font is already loaded in the current session.
  /// 2. If [kIsWeb], it fetches data directly from the network.
  /// 3. If on Native, it checks the local filesystem. If missing, it downloads and caches it.
  /// 4. Registers the font using [FontLoader].
  ///
  /// Returns [true] if successfully loaded, [false] otherwise.
  static Future<bool> load(String fontName) async {
    if (_loadedFonts.contains(fontName)) return true;

    try {
      Uint8List fontData;

      if (kIsWeb) {
        fontData = await _fetchFromNetwork(fontName);
      } else {
        fontData = await _fetchFromStorageOrNetwork(fontName);
      }

      final fontLoader = FontLoader(fontName);
      fontLoader.addFont(Future.value(ByteData.view(fontData.buffer)));
      await fontLoader.load();

      _loadedFonts.add(fontName);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Downloads font data from the predefined CDN.
  ///
  /// Returns [Uint8List] containing the TTF file bytes.
  /// Throws an [Exception] if the download fails.
  static Future<Uint8List> _fetchFromNetwork(String fontName) async {
    final String fontUrl = '$_baseUrl${fontName.toLowerCase()}.ttf';
    final response = await http.get(Uri.parse(fontUrl));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Failed to download font: $fontName");
    }
  }

  /// Handles local caching logic for native platforms (Mobile/Desktop).
  ///
  /// Uses [path_provider] to find the support directory and [dart_io] to 
  /// read/write files. If the platform is Web, it falls back to [_fetchFromNetwork].
  static Future<Uint8List> _fetchFromStorageOrNetwork(String fontName) async {
    if (kIsWeb) return await _fetchFromNetwork(fontName);

    final directory = await getApplicationSupportDirectory();
    final file = dart_io.File('${directory.path}/$fontName.ttf');

    if (await file.exists()) {
      return await file.readAsBytes();
    } else {
      final bytes = await _fetchFromNetwork(fontName);
      await file.writeAsBytes(bytes); 
      return bytes;
    }
  }

  /// Checks if the specific [fontName] has been cached in local storage.
  ///
  /// Note: Always returns [false] on Web as there is no direct filesystem access.
  static Future<bool> isDownloaded(String fontName) async {
    if (kIsWeb) return false;
    
    try {
      final directory = await getApplicationSupportDirectory();
      final file = dart_io.File('${directory.path}/$fontName.ttf');
      return await file.exists();
    } catch (_) {
      return false;
    }
  }
}