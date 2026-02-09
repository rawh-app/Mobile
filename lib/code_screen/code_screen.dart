import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:rawh/code_screen/cubit/code_screen_cubit.dart';
import 'package:rawh/code_screen/cubit/code_screen_state.dart';
import 'package:rawh/forget_password/Toast_Helper.dart';
import 'package:rawh/login_screen/widgets/primary_button.dart';
import 'package:toastification/toastification.dart';

import '../forget_password/cubit/forgetpassword_cubit.dart';

// ignore: must_be_immutable
class CodeScreen extends StatelessWidget {
  String email;
  CodeScreen(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<codeCubit, codestate>(
      listener: (context, state) {
        if (state is codestateSuccess) {
          Navigator.of(context).pushReplacementNamed("ConfirmPassword");
        } else if (state is codestateFailure) {
          ToastHelper.showToast(
            context: context,
            message: state.errMessage,
            type: ToastificationType.error,
          );
        }
      },

      builder: (context, state) {
        final cubit = context.read<codeCubit>();
        final cubitrp = context.read<ForgetPasswordCubit>();
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: const Color(0xffF3F9FF),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
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
                      "أدخل الكود",
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
                      "تم إرسال رابط تعيين كلمة المرور إلى بريدك الإلكتروني",
                      style: GoogleFonts.tajawal(
                        fontSize: 12,
                        color: Color(0xff989898),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: Pinput(
                      controller: cubit.pinController,
                      length: 6,
                      onCompleted: (pin) {
                        cubit.verifyResetCode();
                      },
                      defaultPinTheme: PinTheme(
                        width: 64,
                        height: 70,
                        textStyle: GoogleFonts.tajawal(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF72AADC),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF2874B9)),
                          color: Colors.white,
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 68,
                        height: 71,
                        textStyle: GoogleFonts.tajawal(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2874B9),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF2874B9),
                            width: 2,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '00:04',
                      style: TextStyle(
                        color: Color(0xff777F8C),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'لم يصلك الرابط؟ ',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      BlocBuilder<codeCubit, codestate>(
                        builder: (context, state) {
                          final cubit = context.read<codeCubit>();
                          final isEnabled = cubit.canResend;

                          return InkWell(
                            onTap: isEnabled
                                ? () {
                                    cubitrp.resetPassword(email);
                                  }
                                : null,
                            child: Text(
                              'أعد الإرسال',
                              style: TextStyle(
                                color: isEnabled
                                    ? const Color(0xff2874B9)
                                    : Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  PrimaryButton(
                    text: 'متابعة',
                    onPressed: () {
                      final String code = cubit.pinController.text;
                      if (code.length != 6) {
                        ToastHelper.showToast(
                          context: context,
                          message: "من فضلك أدخل الكود كامل",
                          type: ToastificationType.error,
                        );
                        return;
                      }

                      cubit.verifyResetCode();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
