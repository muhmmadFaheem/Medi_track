class MedicationModel {
  final String id;
  final String name;
  final String genericName;
  final String dosage;
  final String time;
  final String mealTiming;
  bool isTaken;

  MedicationModel({
    required this.id,
    required this.name,
    required this.genericName,
    required this.dosage,
    required this.time,
    required this.mealTiming,
    this.isTaken = false,
  });
}
