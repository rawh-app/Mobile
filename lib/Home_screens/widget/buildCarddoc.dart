import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCarddoc() {
  return Container(
    height: 110,
    margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255), // نفس لون UI
      borderRadius: BorderRadius.circular(50),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 100),
          child: Row(
            children: [
              /// زر ابدأ

              /// النص في النص بالظبط
              Text(
                "تواصل مع الطبيب\nلمتابعة طفلك",
                textAlign: TextAlign.right,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff123655),
                  height: 1.4,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1F3B57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "ابدأ",
                    style: GoogleFonts.tajawal(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        /// الصورة
        Positioned(
          right: -20,
          bottom: 0,
          child: Image.asset('assets/doctor.png', height: 120),
        ),
      ],
    ),
  );
}
