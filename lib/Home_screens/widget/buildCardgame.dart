import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCardgame() {
  return Container(
    height: 110,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Stack(
      children: [
        /// النصوص
        Padding(
          padding: const EdgeInsets.only(right: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // مهم
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// العنوان
              Text(
                'تمارين التنفس',
                textAlign: TextAlign.right,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff123655),
                ),
              ),

              const SizedBox(height: 2),

              /// الوصف
              Text(
                "ساعد طفلك على تحسين التنفس بأسلوب ممتع",
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.tajawal(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff123655),
                ),
              ),

              const SizedBox(height: 6),

              /// الزر
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1F3B57),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
              ),
            ],
          ),
        ),

        /// الصورة
        Positioned(
          right: -10,
          bottom: 0,
          child: Image.asset('assets/boy.png', height: 120),
        ),
      ],
    ),
  );
}
