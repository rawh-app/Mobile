class ChildAssessmentModel {
  String? id;
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
  ChildAssessmentModel();
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
      "hasSevereRunnyNoseWithBreathingDifficulty":
          hasSevereRunnyNoseWithBreathingDifficulty,
      "recurrentChestIssues": recurrentChestIssues,
      "heartCondition": heartCondition,
    };
  }

  factory ChildAssessmentModel.fromJson(Map<String, dynamic> json) {
    return ChildAssessmentModel()
      ..id = json['id']?.toString()
      ..childName = json['childName']
      ..dateOfBirth = json['dateOfBirth']
      ..gender = json['gender']
      ..feverDuration = json['feverDuration']
      ..feverLevel = json['feverLevel']
      ..feverResponse = json['feverResponse']
      ..coughTime = json['coughTime']
      ..coughType = json['coughType']
      ..phlegmStatus = json['phlegmStatus']
      ..coughSeverity = json['coughSeverity']
      ..hasAbnormalBreathingSound = json['hasAbnormalBreathingSound']
      ..breathingEffort = json['breathingEffort']
      ..feedingAbility = json['feedingAbility']
      ..hasChestIndrawing = json['hasChestIndrawing']
      ..hasNasalFlaring = json['hasNasalFlaring']
      ..hasCyanosis = json['hasCyanosis']
      ..fatigueStatus = json['fatigueStatus']
      ..appetiteStatus = json['appetiteStatus']
      ..hasWeakCry = json['hasWeakCry']
      ..hasSevereRunnyNoseWithBreathingDifficulty =
          json['hasSevereRunnyNoseWithBreathingDifficulty']
      ..recurrentChestIssues = json['recurrentChestIssues']
      ..heartCondition = json['heartCondition'];
  }
}

class SurveyStore {
  static final SurveyStore _instance = SurveyStore._internal();
  factory SurveyStore() => _instance;
  SurveyStore._internal();

  ChildAssessmentModel data = ChildAssessmentModel();
}
