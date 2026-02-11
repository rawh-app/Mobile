import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawh/login_screen/widgets/primary_button.dart';
import 'package:rawh/sound/record_sound_screen.dart';

class SoundIntro extends StatelessWidget {
  const SoundIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 226, 237, 248),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.35),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 25, top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      "✅ تم الانتهاء من الخطوة الاولي ",
                      style: GoogleFonts.tajawal(
                        letterSpacing: -0.5,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff5699D5),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "قد أتممنا معك استبيان التشخيص بنجاح",
                      style: GoogleFonts.tajawal(
                        letterSpacing: -0.5,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 33, 88, 140),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'الخطوة التالية : ',
                            style: GoogleFonts.tajawal(
                              letterSpacing: -0.5,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 33, 88, 140),
                            ),
                          ),
                          TextSpan(
                            text: 'تسجيل تنفس طفلك',
                            style: GoogleFonts.tajawal(
                              letterSpacing: -0.5,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: Text(
                      "هذه الخطوة مهمة جدًا للحصول على نتيجة دقيقة \nتساعدنا على تقييم حالة طفلك بشكل أفضل",
                      style: GoogleFonts.tajawal(
                        letterSpacing: -0.5,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff184670),
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: Text(
                      "لا تقلق العملية سهلة وبسيطة وسنرشدك خطوة بخطوة",
                      style: GoogleFonts.tajawal(
                        letterSpacing: -0.5,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Image.asset(
                      'assets/intro_soundscreen.png',
                      width: 250,
                      height: 190,
                      fit: BoxFit.cover,
                    ),
                  ),

                  PrimaryButton(
                    text: 'ابدأ تسجيل النفس',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RecordSoundScreen()),
                      );
                    },
                    color: Color(0xff5699D5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
