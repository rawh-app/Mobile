import 'package:dio/dio.dart';
import 'package:rawh/survey/model.dart';

class ChildAssessmentApi {
  final Dio _dio = Dio();

  Future<String?> submitAssessment(Map<String, dynamic> body) async {
    final response = await _dio.post(
      'https://rawh.runasp.net/api/PneumoniaSurvey',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkOTQ1MDQ1MS1hZTAyLTQ0ZGUtYjU4My1kZDRmNWYxNDE4YWEiLCJlbWFpbCI6Im5hc2FhYWFhYWFhYW1AZXhhbXBsZS5jb20iLCJqdGkiOiI5YmVjNWZmYy0zYzlmLTRmMDAtYTIzMS0xMTIwZDVmNmE4NGQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoibmFzYWFhYWFhYWFhbSIsImV4cCI6MTgwMjczMzQzOCwiaXNzIjoiUkFXSC5jb20iLCJhdWQiOiJSQVdILmNvbSJ9.dVF1alf2odkwnKK4sjew7aKc-qKEAnCOGz-A_e-dDhQ",
        },
        validateStatus: (_) => true,
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data['id'];
    }

    return null;
  }

  Future<Response> updateAssessment(
    String id,
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.put(
      'https://rawh.runasp.net/api/PneumoniaSurvey/$id',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkOTQ1MDQ1MS1hZTAyLTQ0ZGUtYjU4My1kZDRmNWYxNDE4YWEiLCJlbWFpbCI6Im5hc2FhYWFhYWFhYW1AZXhhbXBsZS5jb20iLCJqdGkiOiI5YmVjNWZmYy0zYzlmLTRmMDAtYTIzMS0xMTIwZDVmNmE4NGQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoibmFzYWFhYWFhYWFhbSIsImV4cCI6MTgwMjczMzQzOCwiaXNzIjoiUkFXSC5jb20iLCJhdWQiOiJSQVdILmNvbSJ9.dVF1alf2odkwnKK4sjew7aKc-qKEAnCOGz-A_e-dDhQ",
        },
        validateStatus: (_) => true,
      ),
    );
    return response;
  }

  // GET data by ID
  Future<ChildAssessmentModel?> getAssessment(String id) async {
    final response = await _dio.get(
      'https://rawh.runasp.net/api/PneumoniaSurvey/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkOTQ1MDQ1MS1hZTAyLTQ0ZGUtYjU4My1kZDRmNWYxNDE4YWEiLCJlbWFpbCI6Im5hc2FhYWFhYWFhYW1AZXhhbXBsZS5jb20iLCJqdGkiOiI5YmVjNWZmYy0zYzlmLTRmMDAtYTIzMS0xMTIwZDVmNmE4NGQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoibmFzYWFhYWFhYWFhbSIsImV4cCI6MTgwMjczMzQzOCwiaXNzIjoiUkFXSC5jb20iLCJhdWQiOiJSQVdILmNvbSJ9.dVF1alf2odkwnKK4sjew7aKc-qKEAnCOGz-A_e-dDhQ",
        },
        validateStatus: (_) => true,
      ),
    );

    if (response.statusCode == 200) {
      return ChildAssessmentModel.fromJson(response.data);
    }

    return null;
  }
}
