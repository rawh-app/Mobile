import 'dart:io';
import 'package:dio/dio.dart';

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
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZTJmYTNmZC0yMTRjLTQyMmEtYjE4Zi0wN2I2NmNmMDUzMGYiLCJlbWFpbCI6IkthcmltQGdtYWlsLmNvbSIsImp0aSI6IjY2OTdjZmI5LTczNDctNDlmYS04NGRjLWQ5NzZkNWFmOTA3YiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJLYXJpbSIsImV4cCI6MTgwMTM5NzI2MiwiaXNzIjoiUkFXSC5jb20iLCJhdWQiOiJSQVdILmNvbSJ9.Y9cGwIIKOsY4-q4clHbIi4giXyARqG_jazbIp2Cy5WM",

            //survey token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZTJmYTNmZC0yMTRjLTQyMmEtYjE4Zi0wN2I2NmNmMDUzMGYiLCJlbWFpbCI6IkthcmltQGdtYWlsLmNvbSIsImp0aSI6IjY2OTdjZmI5LTczNDctNDlmYS04NGRjLWQ5NzZkNWFmOTA3YiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJLYXJpbSIsImV4cCI6MTgwMTM5NzI2MiwiaXNzIjoiUkFXSC5jb20iLCJhdWQiOiJSQVdILmNvbSJ9.Y9cGwIIKOsY4-q4clHbIi4giXyARqG_jazbIp2Cy5WM'
          },
        ),
      );

  Future<Response> uploadAudio({
    // required String surveyId,
    required String filePath,
  }) async {
    try {
      String fileName = filePath.split('/').last;

      FormData formData = FormData.fromMap({
        "file":
            "https://rawh.runasp.net/uploads/audio/survey/a64afea1-865e-42ef-8cd5-acf298e4bc4f.m4a",
        /* await MultipartFile.fromFile(
          filePath,
          filename: fileName,
        ),*/
      });

      final response = await _dio.post(
        "PneumoniaSurvey/10/upload-audio",
        data: formData,
        options: Options(contentType: "multipart/form-data"),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
