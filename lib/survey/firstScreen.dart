import 'package:flutter/material.dart';
import 'package:rawh/survey/model.dart';
import 'package:rawh/survey/second_screeen.dart';

class FirstScreenSurvey extends StatefulWidget {
  const FirstScreenSurvey({super.key});

  @override
  State<FirstScreenSurvey> createState() => _FirstScreenSurveyState();
}

class _FirstScreenSurveyState extends State<FirstScreenSurvey> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? selectedGender;

  final survey = SurveyStore().data; // Singleton instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            children: [
              const SizedBox(height: 77),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'ساعدينا نعتني بتنفس طفلك',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'هذا الاستبيان القصير يمنح الفريق الطبي صورة أوضح عن حالة طفلك،\n'
                'مما يساهم في رعاية أدق وأسرع',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 27),

              // ===== Child Name =====
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'اسم الطفل',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                onChanged: (value) {
                  survey.childName = value; // حفظ في Singleton
                },
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 16),

              // ===== Date of Birth =====
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'تاريخ الميلاد',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    final now = DateTime.now();
                    final dateTime = DateTime(
                      pickedDate.year,
                      pickedDate.month,
                      pickedDate.day,
                      now.hour,
                      now.minute,
                      now.second,
                    );

                    dateController.text =
                        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} "
                        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

                    survey.dateOfBirth = dateTime
                        .toUtc()
                        .toIso8601String(); // حفظ في Singleton
                  }
                },
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 16),

              // ===== Gender =====
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الجنس',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                        survey.gender = value; // حفظ في Singleton
                      });
                    },
                  ),
                  const Text('ذكر'),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                        survey.gender = value; // حفظ في Singleton
                      });
                    },
                  ),
                  const Text('أنثى'),
                ],
              ),
              const SizedBox(height: 40),

              // ===== Next Button =====
              SizedBox(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                  onPressed: () {
                    if (survey.childName == null ||
                        survey.dateOfBirth == null ||
                        survey.gender == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('من فضلك أكمل البيانات')),
                      );
                      return;
                    }

                    // Debug print
                    print("First Screen Data: ${survey.toJson()}");

                    // انتقل للشاشة التالية
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SecondScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff577B75),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'متابعة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ===== Skip Button =====
              SizedBox(
                width: double.infinity,
                height: 47,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SecondScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'تخطي',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    );
  }
}
