import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawh/code_screen/cubit/code_screen_state.dart';

class codeCubit extends Cubit<codestate> {
  codeCubit() : super(codeInitial());

  final TextEditingController pinController = TextEditingController();
  final Dio dio = Dio();
  Timer? timer;
  int secondsLeft = 60;
  Future<void> verifyResetCode() async {
    emit(codestateLoading());

    try {
      final formData = FormData.fromMap({'Code': pinController.text});

      final response = await dio.post(
        'https://rawh.runasp.net/api/Auth/verify-reset-code',
        data: formData,
        options: Options(headers: {'Accept-Language': 'en'}),
      );

      if (response.statusCode == 200) {
        emit(codestateSuccess());
      } else {
        emit(codestateFailure(errMessage: "Invalid or expired code"));
      }
    } on DioException catch (e) {
      String errorMessage = e.message.toString();

      if (e.response?.data != null) {
        final data = e.response!.data;

        if (data is String) {
          errorMessage = data;
        } else if (data is Map<String, dynamic>) {
          if (data['message'] is String) {
            errorMessage = data['message'];
          } else if (data['error'] is String) {
            errorMessage = data['error'];
          }
        }
      }

      emit(codestateFailure(errMessage: errorMessage));
    } catch (_) {
      emit(codestateFailure(errMessage: "حدث خطأ غير متوقع"));
    }
  }

  // ================= TIMER =================
  void startTimer() {
    timer?.cancel();
    secondsLeft = 60;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsLeft--;

      emit(codestateTimerTick(secondsLeft));

      if (secondsLeft <= 0) {
        timer.cancel();
      }
    });
  }

  bool get canResend => secondsLeft <= 0;
}
