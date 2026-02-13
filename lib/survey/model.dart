class ChildAssessmentModel {
  // بيانات الطفل الأساسية
  String? childName;
  String? dateOfBirth;
  String? gender;

  // إجابات الأسئلة المتعلقة بالحمى
  String? feverDuration;
  String? feverLevel;
  String? feverResponse;

  // إجابات السعال
  String? coughTime;
  String? coughType;
  String? phlegmStatus;
  String? coughSeverity;

  // تنفس الطفل
  bool? hasAbnormalBreathingSound;
  String? breathingEffort;

  // تغذية الطفل
  String? feedingAbility;
  String? hasChestIndrawing;
  bool? hasNasalFlaring;
  bool? hasCyanosis;
  bool? fatigueStatus;
  String? appetiteStatus;
  bool? hasWeakCry;
  bool? hasSevereRunnyNoseWithBreathingDifficulty;

  // أمراض سابقة / حالة القلب
  String? recurrentChestIssues;
  String? heartCondition;

  // تحويل البيانات إلى JSON عشان تبعتها للـ API
  Map<String, dynamic> toJson() {
    return {
      "childName": childName,
      "dateOfBirth": dateOfBirth,
      "gender": gender,
      "feverDuration": feverDuration,
      "feverLevel": feverLevel,
      "feverResponse": feverResponse,
      "coughTime": coughTime,
      "coughType": coughType,
      "phlegmStatus": phlegmStatus,
      "coughSeverity": coughSeverity,
      "hasAbnormalBreathingSound": hasAbnormalBreathingSound,
      "breathingEffort": breathingEffort,
      "feedingAbility": feedingAbility,
      "hasChestIndrawing": hasChestIndrawing,
      "hasNasalFlaring": hasNasalFlaring,
      "hasCyanosis": hasCyanosis,
      "fatigueStatus": fatigueStatus,
      "appetiteStatus": appetiteStatus,
      "hasWeakCry": hasWeakCry,
      "hasSevereRunnyNoseWithBreathingDifficulty": hasSevereRunnyNoseWithBreathingDifficulty,
      "recurrentChestIssues": recurrentChestIssues,
      "heartCondition": heartCondition,
    };
  }
}

class SurveyStore {
  static final SurveyStore _instance = SurveyStore._internal();
  factory SurveyStore() => _instance;
  SurveyStore._internal();

  ChildAssessmentModel data = ChildAssessmentModel();
}
