import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login_screen/widgets/custom_outlined_Button.dart';
import '../login_screen/widgets/custom_text_field.dart';
import '../login_screen/widgets/primary_button.dart';
import 'controllers/ui_controllers.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  // ✅ instantiate controller
  final SignupController controller = Get.put(SignupController());

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xffF3F9FF),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/logo.png', height: 90),
                ),
                const SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "تسجيل الدخول ",
                    style: GoogleFonts.tajawal(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "سجل دخولك الآن وابدأ رحلة التأهيل !",
                    style: GoogleFonts.tajawal(
                      fontSize: 15,
                      color: Color(0xff989898),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'اسم المستخدم',
                    style: GoogleFonts.tajawal(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                CustomTextField(
                  controller: _usernameController,
                  hintText: 'محمد',
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
                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'كلمة المرور',
                    style: GoogleFonts.tajawal(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 7),

                /// ✅ Use Obx to rebuild when password visibility changes
                Obx(
                      () => CustomTextField(
                    controller: _passwordController,
                    hintText: '********',
                    obscureText: controller.isPasswordHidden.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                PrimaryButton(onPressed: () {}, text: "إنشاء حساب"),
                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'بالنقر على "إنشاء حساب" ، فإنك توافق على ',
                      style: TextStyle(color: Colors.black54, fontSize: 10),
                    ),
                    Text(
                      'الشروط و سياسة الخصوصية',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'أو سجل بواسطة',
                    style: TextStyle(
                      color: Color(0xffB2B2B2),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                customoutlinedButton(
                  imagePath: 'assets/Google.png',
                  text: 'المتابعة باستخدام جوجل',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      ' لديك حساب بالفعل ؟ ',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                      'تسجيل دخول',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}