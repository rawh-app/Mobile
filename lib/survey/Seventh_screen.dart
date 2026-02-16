import 'package:flutter/material.dart';
import 'package:rawh/survey/model.dart';
import 'package:rawh/survey/question_container.dart';
import 'package:rawh/survey/survey_api_services.dart';

class SeventhScreen extends StatefulWidget {
  const SeventhScreen({super.key});

  @override
  State<SeventhScreen> createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> {
  final survey = SurveyStore().data; // Singleton instance
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadExistingSurvey();
  }

  Future<void> loadExistingSurvey() async {
    final id = survey.id;
    if (id != null) {
      final existing = await ChildAssessmentApi().getAssessment(id);
      if (existing != null) {
        SurveyStore().data = existing;
        setState(() {});
      }
    }
  }

  Future<void> submitSurvey() async {
    setState(() => isLoading = true);

    try {
      final body = survey.toJson()
        ..removeWhere(
          (key, value) => value == null || (value is String && value.isEmpty),
        );

      if (survey.id == null) {
        // POST
        final id = await ChildAssessmentApi().submitAssessment(body);
        if (id != null) survey.id = id;
      } else {
        // PUT
        await ChildAssessmentApi().updateAssessment(survey.id!, body);
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('✅ تم حفظ البيانات بنجاح')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('❌ خطأ: $e')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  // دالة مساعدة لطباعة كل البيانات بعد كل اختيار
  void updateSurvey(void Function() updater) {
    updater();
    print('Survey Updated: ${survey.toJson()}');
    setState(() {}); // لضمان تحديث الـ UI مباشرة
  }

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
              child: const Center(
                child: Text(
                  'إجاباتك تساعدنا نتابع حالة طفلك',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Questions
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 120),
                child: Column(
                  children: [
                    const SizedBox(height: 77),

                    // Fatigue
                    QuestionRadioCard(
                      question:
                          'هل يبدو الطفل مرهقاً أو نعساناً أكثر من المعتاد؟',
                      options: ['نعم', 'لا'],
                      onChanged: (int value) {
                        updateSurvey(() {
                          survey.fatigueStatus = value == 0;
                        });
                      },
                    ),
                    const SizedBox(height: 9),

                    // Appetite
                    QuestionRadioCard(
                      question: 'هل يعاني الطفل من ضعف الشهية؟',
                      options: ['يرفض الأكل', 'كمية أقل', 'طبيعي'],
                      onChanged: (int value) {
                        updateSurvey(() {
                          survey.appetiteStatus = value == 0
                              ? 'RefusesCompletely'
                              : value == 1
                              ? 'EatsLessThanUsual'
                              : 'EatsNormally';
                        });
                      },
                    ),
                    const SizedBox(height: 9),

                    // Weak cry
                    QuestionRadioCard(
                      question: 'هل صوت بكاء الطفل أضعف من المعتاد؟',
                      options: ['نعم', 'لا'],
                      onChanged: (int value) {
                        updateSurvey(() {
                          survey.hasWeakCry = value == 0;
                        });
                      },
                    ),
                    const SizedBox(height: 9),

                    // Severe runny nose
                    QuestionRadioCard(
                      question:
                          'هل يعاني الطفل من رشح شديد مع صعوبة في التنفس؟',
                      options: ['نعم', 'لا'],
                      onChanged: (int value) {
                        updateSurvey(() {
                          survey.hasSevereRunnyNoseWithBreathingDifficulty =
                              value == 0;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // زر الإرسال
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff5699D5),
          onPressed: isLoading ? null : submitSurvey,
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  'تعديل',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
