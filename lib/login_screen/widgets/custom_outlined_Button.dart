import 'package:flutter/material.dart';

class customoutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? imagePath;

  const customoutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffC1C1C1)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),

            if (imagePath != null) Image.asset(imagePath!, height: 22),
          ],
        ),
      ),
    );
  }
}
