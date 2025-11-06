import 'package:flutter/material.dart';

class PrimaryButton2 extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton2({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed, // 🟢 نداء الدالة الصحيح
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2874B9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xffEBECEE),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
