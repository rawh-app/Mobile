import 'package:dio/dio.dart';

class ChildAssessmentApi {
  final Dio _dio = Dio();

  /// الآن تأخذ body كامل بدل كل field منفصل
  Future<Response> submitAssessment(Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(
        'https://rawh.runasp.net/api/PneumoniaSurvey',
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlNzI2ZDExOC05YWMyLTQxMWItYTg3Ni0zNWQ4YmUwYzM3NzIiLCJlbWFpbCI6Ik5BU0FNQGdtYWlsLmNvbSIsImp0aSI6ImVkMGZkODE1LTIzMGYtNDllNy05MzZjLTk3Yzc2ODU4MGI5ZSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJOQVNBTSIsImV4cCI6MTgwMTY0OTIyNiwiaXNzIjoiUkFXSC5jb20iLCJhdWQiOiJSQVdILmNvbSJ9.a4ILOsPKXmOJ4ww5ebzI9Pe37Ydhldz_vk15vK0Pwjc',
          },
        ),
      );
      return response;
    } catch (e) {
      print('Dio Error: $e');
      rethrow;
    }
  }
}
