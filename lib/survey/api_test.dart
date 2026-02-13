import 'package:dio/dio.dart';

class test_api {
  final Dio _dio = Dio();

  Future<Response> submitAssessment(
  ) async {
    try {
      final response = await _dio.post(
        'https://rawh.runasp.net/api/PneumoniaSurvey', // 👈 URL كامل
        data: {
          "childName": "osos",
          "dateOfBirth": "2026-01-28T19:23:44.562Z",
          "gender": "Male",
          "feverDuration": "LessThan24Hours",
          "feverLevel": "LessThan38",
          "feverResponse": "ReducedEasily",
          "coughTime": "IncreasesDaytime",
          "coughType": "DryCough",
          "phlegmStatus": "EasyToExit",
          "coughSeverity": "Mild",
          "hasAbnormalBreathingSound": true,
          "breathingEffort": "Normal",
          "feedingAbility": "CanComplete",
          "hasChestIndrawing": "Yes",
          "hasNasalFlaring": true,
          "hasCyanosis": true,
          "fatigueStatus": true,
          "appetiteStatus": "RefusesCompletely",
          "hasWeakCry": true,
          "hasSevereRunnyNoseWithBreathingDifficulty": true,
          "recurrentChestIssues": "Significantly",
          "heartCondition": "Yes"
        },
        options: Options(
          headers: {'Content-Type': 'application/json',//.length,
            'Authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZTJmYTNmZC0yMTRjLTQyMmEtYjE4Zi0wN2I2NmNmMDUzMGYiLCJlbWFpbCI6IkthcmltQGdtYWlsLmNvbSIsImp0aSI6IjY2OTdjZmI5LTczNDctNDlmYS04NGRjLWQ5NzZkNWFmOTA3YiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJLYXJpbSIsImV4cCI6MTgwMTM5NzI2MiwiaXNzIjoiUkFXSC5jb20iLCJhdWQiOiJSQVdILmNvbSJ9.Y9cGwIIKOsY4-q4clHbIi4giXyARqG_jazbIp2Cy5WM'
          },
        ),
      );
      print('here!!!!!!!!!!!!!!!!!!!!!!!');
      print(response);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
