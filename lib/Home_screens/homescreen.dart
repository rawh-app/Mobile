import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rawh/Home_screens/widget/buildCarddoc.dart';
import 'package:rawh/Home_screens/widget/buildCardgame.dart';
import 'package:rawh/Home_screens/widget/historycard.dart';
import 'package:rawh/Home_screens/widget/progresscard.dart';
import 'package:rawh/sound/widget/custom_button.dart';
import 'package:rawh/survey/firstScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffF3F9FF),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // 🔵 الهيدر
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
                padding: const EdgeInsets.only(top: 110),
                child: Column(
                  children: [
                    // كارت نتيجة الحالة
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 300,
                            width: 310,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 25,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/stethoscope.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    Text(
                                      " الحالة الطبية :",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff006802),
                                      ),
                                    ),
                                  ],
                                ),

                                Divider(endIndent: 90),
                                const SizedBox(height: 10),
                                Text(
                                  "مستوى الخطورة : منخفض",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xff006802),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "التهاب رئوي بسيط \nاستمري في المتابعة والعلاج",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff123655),
                                  ),
                                ),

                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 18,
                                      color: Color(0xff2874B9),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "آخر فحص: اليوم، 10:30",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff123655),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0xff123655),
                                      radius: 19,
                                      child: Icon(
                                        Bootstrap.mic_fill,
                                        color: Colors.white,
                                        size: 19,
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Expanded(
                                      child: CustomButton(
                                        color: Color(0xff123655),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  FirstScreenSurvey(),
                                            ),
                                          );
                                        },
                                        borderRadius: 30,
                                        child: Text(
                                          "اعادة الفحص",
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromARGB(
                                              255,
                                              253,
                                              254,
                                              255,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            top: -30,
                            left: -5,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ), // الأحمر الفاتح
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff68C26E),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  height: 87,
                                  width: 87,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff68C26E),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 80,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    const ProgressCard(),
                    const HistoryCard(),
                    buildCardgame(),
                    buildCarddoc(),

                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
