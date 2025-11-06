import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawh/forget_password/forget_password.dart';
import 'package:rawh/google_auth.dart';
import 'package:rawh/login_screen/widgets/custom_text_field.dart';
import 'package:rawh/login_screen/widgets/primary_button.dart';
import 'package:rawh/login_screen/widgets/custom_outlined_Button.dart';
import 'package:rawh/signup_screen/signup_screen.dart';
import 'controllers/data_controller.dart';
import 'controllers/ui_controller.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final LoginApiController apiController = Get.put(LoginApiController());
  final LoginUiController uiController = Get.put(LoginUiController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF3F9FF),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                  "تسجيل الدخول",
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
                  "سجل دخولك الآن وابدأ رحلة التأهيل!",
                  style: GoogleFonts.tajawal(
                    fontSize: 15,
                    color: const Color(0xff989898),
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
              const SizedBox(height: 25),
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

              // ✅ Password Field with Obx
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

              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => ForgetPassword());
                  },
                  child: const Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(color: Colors.blue, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // ✅ Button with Loading
              Obx(() {
                if (apiController.isLoading.value) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.blue));
                }
                return PrimaryButton(
                  text: "تسجيل الدخول",
                  onPressed: () async {
                    await apiController.login(
                      email: _emailController.text,
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
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: Colors.grey[400], thickness: 1)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('أو سجل بواسطة',
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ),
                  Expanded(child: Divider(color: Colors.grey[400], thickness: 1)),
                ],
              ),
              const SizedBox(height: 20),

              customoutlinedButton(
                imagePath: 'assets/Google.png',
                text: 'المتابعة باستخدام جوجل',
                onPressed: () {
                  signInWithGoogle();
                },
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ليس لديك حساب؟ ',
                      style: TextStyle(color: Colors.black54, fontSize: 14)),
                  InkWell(
                    onTap: () => Get.to(() => SignupScreen()),
                    child: const Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
