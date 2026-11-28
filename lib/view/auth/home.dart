import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medi_track/constant/app_colors.dart';
import 'package:medi_track/controller/home_controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('EEEE, MMMM d').format(DateTime.now());

    return Scaffold(
      body: Column(
        children: [
          // Top Teal Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 52, 20, 24),
            decoration: const BoxDecoration(
              color: AppColors.primaryTeal,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(todayDate, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                    const CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: Text("MA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const Text("Good Morning, Muhammad 👋", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Obx(() => Text("You have ${controller.medications.length} medications today", style: const TextStyle(color: Colors.white70))),
              ],
            ),
          ),

          // Progress Bar Banner
          Obx(() {
            int taken = controller.medications.where((m) => m.isTaken).length;
            return Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.lightMintBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.primaryTeal.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Icon(Icons.access_time, color: AppColors.primaryTeal, size: 18),
                    const SizedBox(width: 8),
                    Text("Today, ${DateFormat('MMMM d').format(DateTime.now())}", style: const TextStyle(fontWeight: FontWeight.w600)),
                  ]),
                  Text("$taken of ${controller.medications.length} taken", style: const TextStyle(color: AppColors.primaryTeal, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          }),

          // Medication List
          Expanded(
            child: Obx(() {
              if (controller.medications.isEmpty) {
                return const Center(child: Text("No medications added yet. Tap + to add."));
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.medications.length,
                itemBuilder: (context, index) {
                  final med = controller.medications[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.borderGrey,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.lightMintBg,
                              child: const Icon(Icons.medication, color: AppColors.primaryTeal),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(med.brandName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text(med.genericName, style: const TextStyle(color: AppColors.textGrey, fontSize: 13)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.toggleTaken(med),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: med.isTaken ? AppColors.primaryTeal : Colors.grey.shade200,
                                child: Icon(Icons.check, size: 18, color: med.isTaken ? Colors.white : Colors.transparent),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              const Icon(Icons.schedule, size: 16, color: AppColors.textGrey),
                              const SizedBox(width: 6),
                              Text(med.time, style: const TextStyle(color: AppColors.textGrey, fontSize: 13)),
                            ]),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(color: AppColors.lightMintBg, borderRadius: BorderRadius.circular(8)),
                              child: Text(med.mealTiming, style: const TextStyle(color: AppColors.primaryTeal, fontSize: 12, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
