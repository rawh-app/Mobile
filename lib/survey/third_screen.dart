import 'package:flutter/material.dart';
import 'package:rawh/survey/model.dart';
import 'package:rawh/survey/question_container.dart';
import 'fourth_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final survey = SurveyStore().data; // Singleton instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 19, left: 21, top: 40),
        child: Stack(
          children: [
            // Header container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                color: const Color(0xff5699D5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'إجاباتك تساعدنا نتابع حالة طفلك',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Questions
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 77),

                    // Cough time
                    QuestionRadioCard(
                      question: 'متى يزداد السعال لدى الطفل؟',
                      options: [
                        'يزداد نهاراً',
                        'يزداد ليلاً',
                        'مستمر طوال اليوم',
                        'لا يعاني الطفل من السعال',
                      ],
                      onChanged: (int value) {
                        switch (value) {
                          case 0:
                            survey.coughTime = 'IncreasesDaytime';
                            break;
                          case 1:
                            survey.coughTime =
                                'IncreasesNighttime'; //IncreasesNighttime
                            break;
                          case 2:
                            survey.coughTime =
                                'ContinuousAllDay'; //ContinuousAllDay
                            break;
                          case 3:
                            survey.coughTime = 'NoCough';
                            break;
                        }
                        print('Third Screen Data: ${survey.toJson()}');
                      },
                    ),
                    const SizedBox(height: 9),

                    // Cough type
                    QuestionRadioCard(
                      question: 'ما نوع السعال؟',
                      options: ['سعال جاف', 'سعال مصحوب ببلغم'],
                      onChanged: (int value) {
                        switch (value) {
                          case 0:
                            survey.coughType = 'DryCough'; //DryCough
                            break;
                          case 1:
                            survey.coughType = 'ProductiveCough';
                            break;
                        }
                        print('Third Screen Data: ${survey.toJson()}');
                      },
                    ),
                    const SizedBox(height: 9),

                    // Phlegm status
                    QuestionRadioCard(
                      question: 'إذا وجد البلغم, هل يخرج بسهولة؟',
                      options: [
                        'نعم, البلغم خفيف و يخرج بسهولة',
                        'لا, البلغم كثيف و يصعب خروجه',
                        'لا يوجد بلغم',
                      ],
                      onChanged: (int value) {
                        switch (value) {
                          case 0:
                            survey.phlegmStatus = 'EasyToExit'; //EasyToExit
                            break;
                          case 1:
                            survey.phlegmStatus =
                                'DifficultToExit'; //DifficultToExit
                            break;
                          case 2:
                            survey.phlegmStatus = 'NoPhlegm'; //NoPhlegm
                            break;
                        }
                        print('Third Screen Data: ${survey.toJson()}');
                      },
                    ),
                    const SizedBox(height: 9),

                    // Cough severity
                    QuestionRadioCard(
                      question: 'ما شدة السعال',
                      options: ['خفيف', 'متوسط', 'شديد'],
                      onChanged: (int value) {
                        switch (value) {
                          case 0:
                            survey.coughSeverity = 'Mild';
                            break;
                          case 1:
                            survey.coughSeverity = 'Moderate';
                            break;
                          case 2:
                            survey.coughSeverity = 'Severe';
                            break;
                        }
                        print('Third Screen Data: ${survey.toJson()}');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating button to next screen
      floatingActionButton: SizedBox(
        width: 80,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff5699D5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FourthScreen()),
            );
          },
          child: const Text(
            'التالي',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
