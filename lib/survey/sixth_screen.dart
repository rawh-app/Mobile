import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawh/survey/model.dart';
import 'package:rawh/survey/question_container.dart';
import 'Seventh_screen.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({super.key});

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
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

                      // Chest indrawing
                      QuestionRadioCard(
                        onPressed: () {},
                        question:
                            'هل لاحظت شداً أو انغماساً في صدر الطفل أثناء التنفس؟',
                        options: ['نعم', 'لا', 'غير متأكد'],
                        onChanged: (int value) {
                          switch (value) {
                            case 0:
                              survey.hasChestIndrawing = 'Yes';
                              break;
                            case 1:
                              survey.hasChestIndrawing = 'No';
                              break;
                            case 2:
                              survey.hasChestIndrawing = 'Not Sure';
                              break;
                          }
                          print('Sixth Screen Data: ${survey.toJson()}');
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/video.png',
                              width: 27,
                              height: 27,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "  شاهد هذا الفيديو لترى كيف قد\n يبدو الشد أو الانغماس في صدر الطفل'",
                              style: GoogleFonts.tajawal(
                                letterSpacing: -0.5,
                                fontSize: 13,
                                //fontWeight: FontWeight.w300,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 9),

                      // Nasal flaring
                      QuestionRadioCard(
                        question: 'هل لاحظت اتساع فتحات أنف الطفل مع كل نفس؟',
                        options: ['نعم', 'لا'],
                        onChanged: (int value) {
                          survey.hasNasalFlaring = value == 0;
                          print('Sixth Screen Data: ${survey.toJson()}');
                        },
                      ),
                      const SizedBox(height: 9),

                      // Cyanosis
                      QuestionRadioCard(
                        question: 'هل لاحظت تغير لون شفتي الطفل؟',
                        options: ['نعم', 'لا'],
                        onChanged: (int value) {
                          survey.hasCyanosis = value == 0;
                          print('Sixth Screen Data: ${survey.toJson()}');
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
                    MaterialPageRoute(builder: (_) => SeventhScreen()),
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
