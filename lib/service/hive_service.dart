import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String medBoxName = 'medications_box';
  static const String userBoxName = 'user_box';

  static Future<void> init() async {
    await Hive.initFlutter();
   // Hive.registerAdapter(MedicationAdapter());
  //  await Hive.openBox<MedicationModel>(medBoxName);
    await Hive.openBox(userBoxName);
  }

 // static Box<MedicationModel> get medBox => Hive.box<MedicationModel>(medBoxName);
  static Box get userBox => Hive.box(userBoxName);

  // Auth Helper
  static bool get isLoggedIn => userBox.get('isLoggedIn', defaultValue: false);
  static Future<void> saveUser(String name, String email) async {
    await userBox.put('name', name);
    await userBox.put('email', email);
    await userBox.put('isLoggedIn', true);
  }

  // CRUD for Medications
 // static Future<void> addMedication(MedicationModel med) async => await medBox.put(med.id, med);
 // static List<MedicationModel> getAllMedications() => medBox.values.toList();
//  static Future<void> updateMedication(MedicationModel med) async => await medBox.put(med.id, med);
 // static Future<void> deleteMedication(String id) async => await medBox.delete(id);
}
