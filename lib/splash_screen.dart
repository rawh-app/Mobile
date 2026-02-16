import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawh/login_screen/login_screen.dart';
import 'package:rawh/signup_screen/signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 730,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 13, 45, 74),
                    Color.fromARGB(255, 22, 66, 104),
                    Color(0xff2877BB),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                border: Border(
                  bottom: BorderSide(color: Color(0xffF3F9FF), width: 1.5),
                  right: BorderSide(color: Color(0xffF3F9FF), width: 0.3),
                ),
              ),
              width: 382,
              height: 725,
              child: Center(
                child: Column(
                  children: [
                    Image.asset('assets/nasam.png', height: 300, width: 400),
                    Text(
                      "اطمني على تنفس طفلك",
                      style: GoogleFonts.tajawal(
                        letterSpacing: -0.5,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Text(
                      " وابدئي الآن",
                      style: GoogleFonts.tajawal(
                        letterSpacing: -0.5,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 470,
              child: Image.asset('assets/girl.png', width: 200, height: 200),
            ),
            Positioned(
              right: 90,
              bottom: 30,
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignupScreen()),
                        );
                      },
                      child: Text(
                        " إنشاء الحساب",
                        style: GoogleFonts.tajawal(
                          letterSpacing: -0.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text(
                        " تسجيل الدخول",
                        style: GoogleFonts.tajawal(
                          letterSpacing: -0.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
