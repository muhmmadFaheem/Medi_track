import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/constant/app_colors.dart';
import 'package:medi_track/constant/app_strings.dart';
import 'package:medi_track/controller/home_controller/home_controller.dart';
import 'package:medi_track/widgets/button.dart';
import 'package:medi_track/widgets/textfields.dart';

class AddMedicationView extends StatelessWidget {
  AddMedicationView({super.key});
  final controller = Get.find<HomeController>();
  final mealOptions = ["Before Meal", "After Meal", "Empty Stomach"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryTeal,
        title: const Text(AppStrings.addMedTitle, style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Brand Name", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            CustomTextField(controller: controller.brandCtrl, hintText: AppStrings.brandHint),
            const SizedBox(height: 16),

            const Text("Generic / Salt Name", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: controller.genericCtrl,
              onChanged: controller.checkInteraction,
              decoration: InputDecoration(
                hintText: AppStrings.genericHint,
                filled: true,
                fillColor: AppColors.borderGrey,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 16),

            // Drug Interaction Alert Box (Matches Screenshot 2)
            Obx(() => controller.hasInteraction.value
                ? Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.dangerRedBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.dangerRed),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, color: AppColors.dangerRedBg),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Drug Interaction Alert", style: TextStyle(color: AppColors.dangerRed, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("Aspirin and Ibuprofen may increase stomach bleeding risk.", style: TextStyle(color: Colors.black87, fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Dosage", style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      CustomTextField(controller: controller.dosageCtrl, hintText: "1 Tablet"),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Time", style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () async {
                          TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                          if (picked != null) controller.selectedTime.value = picked.format(context);
                        },
                        child: Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: AppColors.borderGrey,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Text(controller.selectedTime.value)),
                              const Icon(Icons.access_time, color: AppColors.primaryTeal, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text("Meal Timing", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Obx(() => Wrap(
                  spacing: 8,
                  children: mealOptions.map((meal) {
                    bool isSelected = controller.selectedMeal.value == meal;
                    return ChoiceChip(
                      label: Text(meal),
                      selected: isSelected,
                      selectedColor: AppColors.primaryTeal,
                      labelStyle: TextStyle(color: isSelected ? Colors.white : AppColors.textDark),
                      onSelected: (_) => controller.selectedMeal.value = meal,
                    );
                  }).toList(),
                )),
            const SizedBox(height: 36),
            CustomButton(text: AppStrings.saveReminder, onPressed: controller.saveMedication),
          ],
        ),
      ),
    );
  }
}
