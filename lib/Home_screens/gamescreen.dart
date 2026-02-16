import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gamescreen extends StatelessWidget {
  const Gamescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF3F9FF),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              /// 🔵 الهيدر
              Container(
                width: double.infinity,
                height: 140,
                decoration: const BoxDecoration(
                  color: Color(0xff2874B9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                color: Color(0xff123655),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "محمد أحمد محمد",
                              style: GoogleFonts.tajawal(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.settings, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -35),
                      child: _gameCard("Balloon", "assets/ballon.png"),
                    ),

                    _gameCard("Harvest", "assets/Harvest.png"),
                    _gameCard("Dragon", "assets/dragon.png"),
                    _gameCard("Diver", "assets/driver.png"),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// كارت اللعبة
  Widget _gameCard(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            /// صورة اللعبة
            Image.asset(
              image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            /// جرادينت علشان الاسم يبقى واضح
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            /// اسم اللعبة داخل الصورة
            Positioned(
              top: 14,
              right: 16,
              child: Text(
                title,
                style: GoogleFonts.tajawal(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black45,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),

            /// زرار ابدأ
            Positioned(
              bottom: 12,
              right: 12,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E86DE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  size: 18,
                  color: Colors.white,
                ),
                label: const Text(
                  "ابدأ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
