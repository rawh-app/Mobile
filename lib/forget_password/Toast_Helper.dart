import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';


class ToastHelper {
  static void showToast({
    required BuildContext context,
    required String message,
    ToastificationType type = ToastificationType.info,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      title: Text(
        message,
        style: const TextStyle(fontSize: 13,color: Colors.white),
        softWrap: false,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(20),
      margin: const EdgeInsets.symmetric(horizontal: 53, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 1),

    );
  }
}
