import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawh/code_screen/code_screen.dart';
import 'package:rawh/login_screen/widgets/custom_text_field.dart';
import 'package:rawh/login_screen/widgets/primary_button.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF3F9FF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/logo.png', height: 90),
                ),
                const SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "نسيت كلمة المرور؟",
                    style: GoogleFonts.tajawal(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "من فضلك ادخل البريد الإلكتروني المرتبط بحسابك!",
                    style: GoogleFonts.tajawal(
                      fontSize: 12,
                      color: Color(0xff989898),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'البريد الإلكتروني',
                    style: GoogleFonts.tajawal(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'rawhapp@example.com',
                ),
                const SizedBox(height: 80),
                PrimaryButton(
                  text: 'إرسال الكود',
                  onPressed: () {
                    Get.to(CodeScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
