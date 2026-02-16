import 'package:flutter/material.dart';
import 'package:rawh/survey/model.dart';
import 'package:rawh/survey/question_container.dart';

import 'fifth_screen.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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

                    // Abnormal breathing sound
                    QuestionRadioCard(
                      question: 'هل يصدر صوت غير طبيعي أثناء تنفس الطفل؟',
                      options: ['نعم', 'لا'],
                      onChanged: (int value) {
                        survey.hasAbnormalBreathingSound = value == 0;
                        print('Fourth Screen Data: ${survey.toJson()}');
                      },
                    ),
                    const SizedBox(height: 9),

                    // Breathing effort
                    QuestionRadioCard(
                      question:
                          'هل تنفس الطفل سريع أو يبدو عليه التعب أثناء التنفس؟',
                      options: [
                        'لا, تنفسه طبيعي',
                        'نعم, تنفسه سريع',
                        'نعم, يبدو عليه التعب أثناء التنفس',
                      ],
                      onChanged: (int value) {
                        switch (value) {
                          case 0:
                            survey.breathingEffort = 'Normal';
                            break;
                          case 1:
                            survey.breathingEffort = 'FastBreathing';
                            break;
                          case 2:
                            survey.breathingEffort =
                                'LooksExhausted'; //LooksExhausted
                            break;
                        }
                        print('Fourth Screen Data: ${survey.toJson()}');
                      },
                    ),
                    const SizedBox(height: 9),

                    // Feeding ability
                    QuestionRadioCard(
                      question:
                          'هل يستطيع الطفل إكمال الرضعة أو الوجبة دون توقف؟',
                      options: [
                        'نعم',
                        'لا, يتوقف لالتقاط أنفاسه',
                        'يتعب بسرعة و لا يكمل',
                      ],
                      onChanged: (int value) {
                        switch (value) {
                          case 0:
                            survey.feedingAbility = 'CanComplete';
                            break;
                          case 1:
                            survey.feedingAbility = 'StopsToCatchBreath';
                            break;
                          case 2:
                            survey.feedingAbility = 'DifficultyCompleting';
                            break;
                        }
                        print('Fourth Screen Data: ${survey.toJson()}');
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
              MaterialPageRoute(builder: (_) => FifthScreen()),
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
