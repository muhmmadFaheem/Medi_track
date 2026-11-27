import 'package:hive/hive.dart';

class MedicationModel {
  String id;
  String brandName;
  String genericName;
  String dosage;
  String time;       // e.g., "08:00 AM"
  String mealTiming; // "Before Meal", "After Meal", "Empty Stomach"
  bool isTaken;

  MedicationModel({
    required this.id,
    required this.brandName,
    required this.genericName,
    required this.dosage,
    required this.time,
    required this.mealTiming,
    this.isTaken = false,
  });
}

class MedicationAdapter extends TypeAdapter<MedicationModel> {
  @override
  final int typeId = 0;

  @override
  MedicationModel read(BinaryReader reader) {
    return MedicationModel(
      id: reader.readString(),
      brandName: reader.readString(),
      genericName: reader.readString(),
      dosage: reader.readString(),
      time: reader.readString(),
      mealTiming: reader.readString(),
      isTaken: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, MedicationModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.brandName);
    writer.writeString(obj.genericName);
    writer.writeString(obj.dosage);
    writer.writeString(obj.time);
    writer.writeString(obj.mealTiming);
    writer.writeBool(obj.isTaken);
  }
}
