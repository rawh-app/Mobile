import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login_screen/widgets/custom_outlined_Button.dart';
import '../login_screen/widgets/custom_text_field.dart';
import '../login_screen/widgets/primary_button.dart';
import 'controllers/data_controller.dart';
import 'controllers/ui_controllers.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  // 🟢 Controllers
  final SignupController uiController = Get.put(SignupController()); // UI controller
  final SignUpController apiController = Get.put(SignUpController()); // API controller

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
                    "إنشاء حساب",
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
                    "سجل حسابك الآن وابدأ رحلتك !",
                    style: GoogleFonts.tajawal(
                      fontSize: 15,
                      color: const Color(0xff989898),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🟢 Username field
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

                // 🟢 Email field
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

                // 🟢 Password field with visibility toggle
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

                Obx(
                      () => CustomTextField(
                    controller: _passwordController,
                    hintText: '********',
                    obscureText: uiController.isPasswordHidden.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        uiController.isPasswordHidden.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: uiController.togglePasswordVisibility,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🟢 Signup button
                Obx(() {
                  if (apiController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    );
                  }

                  return PrimaryButton(
                    text: "إنشاء حساب",
                    onPressed: () async {
                      await apiController.signUp(
                        email: _emailController.text,
                        username: _usernameController.text,
                        password: _passwordController.text,
                      );

                      Get.snackbar(
                        "الحالة",
                        apiController.message.value,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.white,
                        colorText: Colors.black,
                      );
                    },
                  );
                }),
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
