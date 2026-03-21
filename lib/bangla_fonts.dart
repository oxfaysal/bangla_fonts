import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

/// A Flutter package to load and use popular Bangla fonts dynamically from CDN.
/// Developed by LoomixDev (Faysal).
class BanglaFonts {
  /// Base URL for the Bangla Fonts CDN.
  static const String _baseUrl = "https://oxfaysal.github.io/bangla_fonts_cdn/fonts/";

  /// Font Name Constants for ease of use.
  static const String adorshoLipi = "adorsholipi";
  static const String kalpurush = "kalpurush";
  static const String liAdornoIrrit = "liadornoirrit";
  static const String mukti = "mukti";
  static const String nikosh = "nikosh";
  static const String sagar = "sagar";
  static const String shadhinata = "shadhinata";
  static const String showpnocari = "showpnocari";
  static const String sylheti = "sylheti";
  static const String siyamRupali = "siyamrupali";

  /// Internal cache to track loaded fonts during the current session.
  static final Set<String> _loadedFonts = {};

  /// Loads a specific Bangla font by name.
  /// 
  /// It first checks if the font is already loaded in the session.
  /// Then it checks the local device storage (cache).
  /// If not found locally, it downloads the font from the CDN.
  /// 
  /// Returns [true] if the font is successfully loaded and registered.
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

  /// Checks if a specific font is already downloaded to the local storage.
  static Future<bool> isDownloaded(String fontName) async {
    final directory = await getApplicationSupportDirectory();
    final file = File('${directory.path}/$fontName.ttf');
    return await file.exists();
  }
}