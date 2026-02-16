import 'package:flutter/material.dart';
import 'package:rawh/survey/model.dart';
import 'package:rawh/survey/question_container.dart';

import 'sixth_screen.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  final survey = SurveyStore().data; // Singleton instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 19, left: 21, top: 40),
        child: Stack(
          children: [
            // Header
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

                    // Recurrent chest issues
                    QuestionRadioCard(
                      question:
                          'هل يعاني الطفل من سعال متكرر أو مشكلات صدرية متكررة؟',
                      options: ['نعم، تتكرر بشكل ملحوظ', 'أحيانًا', 'نادراً'],
                      onChanged: (int value) {
                        switch (value) {
                          case 0:
                            survey.recurrentChestIssues = 'Significantly';
                            break;
                          case 1:
                            survey.recurrentChestIssues = 'Sometimes';
                            break;
                          case 2:
                            survey.recurrentChestIssues = 'Rarely';
                            break;
                        }
                        print('Fifth Screen Data: ${survey.toJson()}');
                      },
                    ),
                    const SizedBox(height: 9),

                    // Heart condition
                    QuestionRadioCard(
                      question: 'هل سبق أن شُخّص الطفل بمشكلة في القلب؟',
                      options: ['نعم', 'لا', 'لا أعلم'],
                      onChanged: (int value) {
                        switch (value) {
                          case 0:
                            survey.heartCondition = 'Yes';
                            break;
                          case 1:
                            survey.heartCondition = 'No';
                            break;
                          case 2:
                            survey.heartCondition = 'IDontKnow';
                            break;
                        }
                        print('Fifth Screen Data: ${survey.toJson()}');
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
              MaterialPageRoute(builder: (_) => SixthScreen()),
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
