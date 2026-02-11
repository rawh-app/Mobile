import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;
  final double borderRadius;
  const CustomButton({
    super.key,

    required this.child,
    required this.onPressed,
    this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        //()async{
        //await onPressed;
        //},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? const Color(0xFF2874B9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
