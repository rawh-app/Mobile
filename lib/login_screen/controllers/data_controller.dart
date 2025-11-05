import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../services/loginServices.dart';

class LoginController extends GetxController {
  final Loginservices _loginServices = Loginservices();

  var isLoading = false.obs;
  var message = ''.obs;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      dio.Response response = await _loginServices.signUp(
        email: email,
        password: password,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        message.value = "تم تسجيل الدخول بنجاح ✅";
      } else {
        final data = response.data;

        if (data is Map && data.containsKey('message')) {
          message.value = data['message'];
        } else if (data is String) {
          message.value = data;
        } else if (data is List) {
          message.value = data.join('\n');
        } else {
          message.value = "فشل تسجيل الدخول ❌";
        }
      }
    } catch (e) {
      message.value = "حدث خطأ في الاتصال بالسيرفر: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
