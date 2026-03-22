import 'package:flutter/material.dart';
import 'package:bangla_fonts/bangla_fonts.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FontExample(),
  ));
}

class FontExample extends StatelessWidget {
  const FontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bangla Fonts Example"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ১. সাধারণ টেক্সট (Text Widget)
            const Text(
              "আমার সোনার বাংলা (Kalpurush)",
              style: TextStyle(
                fontFamily: BanglaFonts.kalpurush,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 30),

            // ২. ইনপুট ফিল্ড (TextField Widget)
            TextField(
              style: const TextStyle(fontFamily: BanglaFonts.hindSiliguri),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "আপনার নাম লিখুন",
                labelStyle: const TextStyle(fontFamily: BanglaFonts.hindSiliguri),
                hintText: "এখানে টাইপ করুন...",
                hintStyle: TextStyle(fontFamily: BanglaFonts.hindSiliguri, color: Colors.grey[400]),
              ),
            ),

            const SizedBox(height: 30),

            // ৩. লিস্ট আইটেম (ListTile Widget)
            Card(
              child: ListTile(
                leading: const Icon(Icons.font_download),
                title: const Text(
                  "সিলেটি ভাষার মায়া",
                  style: TextStyle(fontFamily: BanglaFonts.sylheti, fontSize: 18),
                ),
                subtitle: const Text(
                  "Bangla Fonts Package এর জাদু",
                  style: TextStyle(fontFamily: BanglaFonts.anekBangla),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),

            const SizedBox(height: 40),

            // ৪. বাটন টিপে ফন্ট লোড করা
            ElevatedButton.icon(
              onPressed: () async {
                await BanglaFonts.load(BanglaFonts.solaimanLipi);
                print("SolaimanLipi Loaded!");
              },
              icon: const Icon(Icons.download),
              label: const Text("Load SolaimanLipi Font"),
            ),
          ],
        ),
      ),
    );
  }
}