import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'forgetpassword_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  TextEditingController resetPasswordemail = TextEditingController();
  final Dio _dio = Dio();

  Future<void> resetPassword(String email) async {
    emit(ForgetPasswordLoading());

    try {
      final formData = FormData.fromMap({'email': email});

      final response = await _dio.post(
        'https://rawh.runasp.net/api/Auth/send-reset-code',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      if (response.statusCode == 200) {
        emit(ForgetPasswordSuccess(message: "تم إرسال الكود بنجاح"));
      } else {
        emit(ForgetPasswordError("حدث خطأ"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        emit(
          ForgetPasswordError(
            e.response?.data['errors']?['email']?.first ??
                "حدث خطأ أثناء الإرسال",
          ),
        );
      } else {
        emit(ForgetPasswordError("فشل الاتصال "));
      }
    } catch (e) {
      emit(ForgetPasswordError("حدث خطأ غير متوقع"));
    }
  }
}
