import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../data_services/signupservices.dart';

class SignUpController extends GetxController {
  final SignUpServices _signUpServices = SignUpServices();

  var isLoading = false.obs;
  var message = ''.obs;

  Future<void> signUp({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      dio.Response response = await _signUpServices.signUp(
        email: email,
        username: username,
        password: password,
      );

      // ✅ الحالة الناجحة
      if (response.statusCode == 200 || response.statusCode == 201) {
        message.value = "تم إنشاء الحساب بنجاح 🎉";
      }
      // ⚠️ الحالة الفاشلة (من السيرفر)
      else {
        final data = response.data;

        if (data is Map && data.containsKey('message')) {
          // لو السيرفر بيرجع {"message": "..."}
          message.value = data['message'];
        } else if (data is String) {
          // لو السيرفر بيرجع نص عادي (string)
          message.value = data;
        } else if (data is List) {
          // لو بيرجع list من الرسائل
          message.value = data.join('\n');
        } else {
          message.value = "حدث خطأ أثناء إنشاء الحساب ❌";
        }
      }
    } catch (e) {
      message.value = "حدث خطأ في الاتصال بالسيرفر: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
