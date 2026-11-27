// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../data/models/medication_model.dart';
// import '../../../data/models/drug_model.dart';

// class HomeController extends GetxController {
//   var currentTabIndex = 0.obs;

//   // Home Screen Medications (matching your UI screenshot)
//   var medications = <MedicationModel>[
//     MedicationModel(
//       id: '1',
//       name: 'Amoxicillin',
//       genericName: 'Amoxicillin Trihydrate',
//       dosage: '500mg • 1 Capsule',
//       time: '08:00 AM',
//       mealTiming: 'Before Meal',
//       isTaken: true,
//     ),
//     MedicationModel(
//       id: '2',
//       name: 'Ibuprofen',
//       genericName: 'NSAID Anti-inflammatory',
//       dosage: '400mg • 1 Tablet',
//       time: '01:00 PM',
//       mealTiming: 'After Meal',
//       isTaken: false,
//     ),
//     MedicationModel(
//       id: '3',
//       name: 'Lisinopril',
//       genericName: 'ACE Inhibitor',
//       dosage: '10mg • 1 Tablet',
//       time: '06:00 PM',
//       mealTiming: 'Empty Stomach',
//       isTaken: false,
//     ),
//     MedicationModel(
//       id: '4',
//       name: 'Metformin',
//       genericName: 'Metformin Hydrochloride',
//       dosage: '500mg • 1 Tablet',
//       time: '09:00 PM',
//       mealTiming: 'After Meal',
//       isTaken: false,
//     ),
//   ].obs;

//   // Add Medication Form State
//   final brandNameCtrl = TextEditingController();
//   final genericNameCtrl = TextEditingController();
//   final dosageCtrl = TextEditingController(text: '400mg');
//   final timeCtrl = TextEditingController(text: '09:00 AM');
//   var selectedMealTiming = 'Before Meal'.obs;

//   // Drug Database State
//   var selectedDrug = DrugModel(
//     name: 'Ibuprofen 400mg',
//     subtitle: 'NSAID • Analgesic & Antipyretic',
//     mechanismOfAction:
//         'Non-selective inhibitor of cyclooxygenase (COX-1 and COX-2) enzymes, reducing prostaglandin synthesis responsible for pain and inflammation.',
//     commonSideEffects:
//         'Nausea, dyspepsia, mild gastrointestinal discomfort, dizziness, and headache.',
//     highRiskWarnings:
//         'Contraindicated in active peptic ulcer disease, severe renal impairment, and third-trimester pregnancy. Increased risk of GI bleeding.',
//   ).obs;

//   // Settings State
//   var isArabic = false.obs;

//   void changeTab(int index) {
//     currentTabIndex.value = index;
//   }

//   void toggleMedicationTaken(String id) {
//     final index = medications.indexWhere((m) => m.id == id);
//     if (index != -1) {
//       medications[index].isTaken = !medications[index].isTaken;
//       medications.refresh();
//     }
//   }

//   void saveNewMedication() {
//     if (brandNameCtrl.text.trim().isEmpty) {
//       Get.snackbar('Required', 'Please enter a brand name');
//       return;
//     }
//     medications.add(
//       MedicationModel(
//         id: DateTime.now().millisecondsSinceEpoch.toString(),
//         name: brandNameCtrl.text.trim(),
//         genericName: genericNameCtrl.text.trim().isEmpty
//             ? 'Generic Formulation'
//             : genericNameCtrl.text.trim(),
//         dosage: dosageCtrl.text.trim(),
//         time: timeCtrl.text.trim(),
//         mealTiming: selectedMealTiming.value,
//       ),
//     );
//     brandNameCtrl.clear();
//     genericNameCtrl.clear();
//     Get.back();
//     Get.snackbar('Saved', 'Medication reminder scheduled');
//   }
// }
