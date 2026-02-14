import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  final Dio _dio;

  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: "https://rawh.runasp.net/api/",
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlNzI2ZDExOC05YWMyLTQxMWItYTg3Ni0zNWQ4YmUwYzM3NzIiLCJlbWFpbCI6Ik5BU0FNQGdtYWlsLmNvbSIsImp0aSI6ImVkMGZkODE1LTIzMGYtNDllNy05MzZjLTk3Yzc2ODU4MGI5ZSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJOQVNBTSIsImV4cCI6MTgwMTY0OTIyNiwiaXNzIjoiUkFXSC5jb20iLCJhdWQiOiJSQVdILmNvbSJ9.a4ILOsPKXmOJ4ww5ebzI9Pe37Ydhldz_vk15vK0Pwjc",
          },
        ),
      );

  Future<Response?> uploadAudio({required String filePath}) async {
    try {
      String fileName = filePath.split('/').last;

      FormData formData = FormData.fromMap({
        "AudioRecord": await MultipartFile.fromFile(
          filePath,
          filename: fileName,
          contentType: MediaType("audio", "m4a"),
        ),
      });
      print("HEADERS : ${_dio.options.headers}");

      final response = await _dio.post(
        "PneumoniaSurvey/10/upload-audio",
        data: formData,
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE DATA: ${response.data}");
      return response;
    } on DioException catch (e) {
      print("STATUS: ${e.response?.statusCode}");
      print("ERROR DATA: ${e.response?.data}");
      return e.response;
    }
  }
}
