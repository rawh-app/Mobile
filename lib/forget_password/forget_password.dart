import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawh/code_screen/code_screen.dart';
import 'package:rawh/login_screen/widgets/custom_text_field.dart';
import 'package:rawh/login_screen/widgets/primary_button.dart';
import 'package:toastification/toastification.dart';
import '../Toast_Helper.dart';
import 'cubit/forgetpassword_cubit.dart';
import 'cubit/forgetpassword_state.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            ToastHelper.showToast(
              context: context,
              message: state.message,
              type: ToastificationType.success,
            );

            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const CodeScreen()));
          } else if (state is ForgetPasswordError) {
            ToastHelper.showToast(
              context: context,
              message: state.error,
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: const Color(0xffF3F9FF),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 45,
                ),
                child: SingleChildScrollView(
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
                        controller: cubit.resetPasswordemail,
                        hintText: 'rawhapp@example.com',
                      ),
                      const SizedBox(height: 80),
                      PrimaryButton(
                        text: state is ForgetPasswordLoading
                            ? 'جاري الإرسال...'
                            : 'إرسال الكود',
                        onPressed: state is ForgetPasswordLoading
                            ? null
                            : () {
                                final email = cubit.resetPasswordemail.text;
                                if (email.isNotEmpty) {
                                  cubit.resetPassword(email);
                                } else {
                                  ToastHelper.showToast(
                                    context: context,
                                    message:
                                        "من فضلك أدخل البريد الإلكتروني أولاً",
                                    type: ToastificationType.error,
                                  );
                                }
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
