import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawh/confirm_password/cubit/confirm_password_state.dart';

class ConfirmPasswordCubit extends Cubit<ConfirmPasswordState> {
  ConfirmPasswordCubit() : super(ConfirmPasswordInitial());

  final TextEditingController newpassController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final Dio dio = Dio();

  int secondsLeft = 60;
  Future<void> setNewPassword() async {
    emit(ConfirmPasswordLoading());

    try {
      final formData = FormData.fromMap({
        'password': newpassController.text,
        'confirmPassword': confirmpassController.text,
      });

      final response = await dio.post(
        'https://rawh.runasp.net/api/Auth/set-new-password',
        data: formData,
        options: Options(headers: {'Accept-Language': 'en'}),
      );

      if (response.statusCode == 200) {
        emit(ConfirmPasswordSuccess());
      } else {
        emit(ConfirmPasswordFailure(errMessage: "Invalid or expired code"));
      }
    } on DioException catch (e) {
      String errorMessage = 'Something went wrong';

      if (e.response != null) {
        final data = e.response!.data;

        if (data is String) {
          errorMessage = data;
        }
      } else {
        errorMessage = e.message ?? 'Network error';
      }

      emit(ConfirmPasswordFailure(errMessage: errorMessage));
    }
  }
}
