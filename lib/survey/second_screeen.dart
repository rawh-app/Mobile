import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawh/survey/model.dart';
import 'package:rawh/survey/question_container.dart';

import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final survey = SurveyStore().data; // Singleton instance

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'إجاباتك تساعدنا نتابع حالة طفلك',
                        style: GoogleFonts.tajawal(
                          letterSpacing: -0.5,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(255, 0, 0, 0),
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

                      // Fever duration question
                      QuestionRadioCard(
                        question: 'منذ متى بدأت حرارة الطفل في الارتفاع؟',
                        options: [
                          'منذ أقل من 24 ساعة',
                          'من 1-3 أيام',
                          'منذ أكثر من 3 أيام',
                          'حرارة الطفل طبيعية',
                        ],
                        onChanged: (int value) {
                          switch (value) {
                            case 0:
                              survey.feverDuration = 'LessThan24Hours';
                              break;
                            case 1:
                              survey.feverDuration = 'From1To3Days';
                              break;
                            case 2:
                              survey.feverDuration = 'MoreThanDays3';
                              break;
                            case 3:
                              survey.feverDuration = 'NormalTemperature';
                              break;
                          }
                        },
                      ),
                      const SizedBox(height: 9),

                      // Fever level question
                      QuestionRadioCard(
                        question: 'ما أعلى درجة حرارة سجلت لطفلك؟',
                        options: [
                          'أقل من 38',
                          'من 38 إلى 39',
                          'أعلى من 39',
                          'لم يتم قياس درجة الحرارة',
                        ],
                        onChanged: (int value) {
                          switch (value) {
                            case 0:
                              survey.feverLevel = 'LessThan38';
                              break;
                            case 1:
                              survey.feverLevel = 'From38To39';
                              break;
                            case 2:
                              survey.feverLevel = 'MoreThan39';
                              break;
                            case 3:
                              survey.feverLevel = 'NotMeasured'; //NotMeasured
                              break;
                          }
                        },
                      ),
                      const SizedBox(height: 9),

                      // Fever response question
                      QuestionRadioCard(
                        question:
                            'هل تنخفض درجة الحرارة بعد إعطاء خافض الحرارة؟',
                        options: [
                          'نعم، تنخفض بسهولة',
                          'تنخفض بصعوبة',
                          'لا تنخفض',
                          'لم يأخذ الطفل خافض للحرارة',
                        ],
                        onChanged: (int value) {
                          switch (value) {
                            case 0:
                              survey.feverResponse = 'ReducedEasily';
                              break;
                            case 1:
                              survey.feverResponse =
                                  'ReducedWithDifficulty'; //ReducedWithDifficulty
                              break;
                            case 2:
                              survey.feverResponse = 'NotReduced';
                              break;
                            case 3:
                              survey.feverResponse = 'DidNotTakeMedicine';
                              break;
                          }
                          print(
                            'Second Screen Data: ${survey.toJson()}',
                          ); // Debug
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// زرار السابق
            SizedBox(
              width: 80,
              child: FloatingActionButton(
                heroTag: "prevBtn",
                backgroundColor: const Color(0xff5699D5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'السابق',
                  style: GoogleFonts.tajawal(
                    letterSpacing: -0.5,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 180),

            /// زرار التالي
            SizedBox(
              width: 80,
              child: FloatingActionButton(
                heroTag: "nextBtn",
                backgroundColor: const Color(0xff5699D5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ThirdScreen()),
                  );
                },
                child: Text(
                  'التالي',
                  style: GoogleFonts.tajawal(
                    letterSpacing: -0.5,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
