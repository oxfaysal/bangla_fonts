import 'package:flutter/material.dart';
import 'package:bangla_fonts/bangla_fonts.dart';

/// The main entry point of the application.
/// We ensure Flutter bindings are initialized before loading the font.
void main() async {
  // 1. Ensure Flutter framework is fully initialized.
  // This is required before calling any asynchronous plugin methods in main().
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Pre-load a primary font before the app starts.
  // This prevents layout shifts and ensures the user sees the styled text immediately.
  await BanglaFonts.load(BanglaFonts.kalpurush);

  runApp(const MyApp());
}

/// The root widget of the application where the theme and home page are defined.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bangla Fonts Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const FontDemoPage(),
    );
  }
}

/// A demo page to showcase dynamic font loading and previews.
class FontDemoPage extends StatefulWidget {
  const FontDemoPage({super.key});

  @override
  State<FontDemoPage> createState() => _FontDemoPageState();
}

class _FontDemoPageState extends State<FontDemoPage> {
  // Flags to track font loading status and UI state.
  bool isShadhinataLoaded = false;
  bool isLoading = false;

  /// Handles the dynamic downloading and registration of a font at runtime.
  Future<void> _handleFontLoading() async {
    setState(() => isLoading = true);

    // Call the load function from the package.
    // It checks local cache first, then downloads from CDN if not found.
    bool success = await BanglaFonts.load(BanglaFonts.shadhinata);

    if (success) {
      if (mounted) {
        setState(() {
          isShadhinataLoaded = true;
          isLoading = false;
        });

        // Show a success message to the user.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Shadhinata Font Loaded Successfully!')),
        );
      }
    } else {
      if (mounted) {
        setState(() => isLoading = false);
        // Error handling could be added here.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bangla Fonts Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Example 1: Kalpurush Font (Pre-loaded in main function).
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "PRE-LOADED FONT (KALPURUSH)",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "আমার সোনার বাংলা আমি তোমায় ভালোবাসি",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: BanglaFonts.kalpurush,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Example 2: Dynamic Font Loading (Shadhinata font loaded on demand).
              isShadhinataLoaded
                  ? Card(
                      color: Colors.blue.withOpacity(0.05),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "জয় বাংলা জয় বঙ্গবন্ধু (Shadhinata)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: BanglaFonts.shadhinata,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        const Text(
                          "Shadhinata font is not loaded yet.",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 15),
                        isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton.icon(
                                onPressed: _handleFontLoading,
                                icon: const Icon(Icons.download_rounded),
                                label: const Text("Load Shadhinata Font"),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                              ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
