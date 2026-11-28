import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/model/medication_model.dart';
import 'package:medi_track/service/hive_service.dart';
import 'package:medi_track/service/notification_service/notification_service.dart';

class HomeController extends GetxController {
  var medications = <MedicationModel>[].obs;

  // Add Med Form Controllers
  final brandCtrl = TextEditingController();
  final genericCtrl = TextEditingController();
  final dosageCtrl = TextEditingController(text: "1 Tablet");
  var selectedTime = "08:00 AM".obs;
  var selectedMeal = "Before Meal".obs;
  var hasInteraction = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMedications();
  }

  void loadMedications() {
    medications.value = HiveService.getAllMedications();
  }

  void toggleTaken(MedicationModel med) async {
    med.isTaken = !med.isTaken;
    await HiveService.updateMedication(med);
    medications.refresh();
  }

  void checkInteraction(String val) {
    final lower = val.toLowerCase();
    hasInteraction.value = lower.contains("ibuprofen") || lower.contains("aspirin");
  }

  Future<void> saveMedication() async {
    if (brandCtrl.text.isEmpty || genericCtrl.text.isEmpty) {
      Get.snackbar("Required", "Please enter Brand and Generic name");
      return;
    }

    final newMed = MedicationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      brandName: brandCtrl.text.trim(),
      genericName: genericCtrl.text.trim(),
      dosage: dosageCtrl.text.trim(),
      time: selectedTime.value,
      mealTiming: selectedMeal.value,
    );

    await HiveService.addMedication(newMed);
    await NotificationService.scheduleReminder(
      id: newMed.id.hashCode,
      title: "Time for ${newMed.brandName}",
      body: "${newMed.dosage} • ${newMed.mealTiming}",
      scheduledTime: DateTime.now().add(const Duration(seconds: 10)), // Demo trigger in 10s
    );

    brandCtrl.clear();
    genericCtrl.clear();
    hasInteraction.value = false;
    loadMedications();
    Get.back();
  }
}
