// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
// import '../../../core/routes/app_pages.dart';
// import '../controllers/home_controller.dart';

// class HomeView extends StatelessWidget {
//   HomeView({super.key});
//   final controller = Get.find<HomeController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Get.toNamed(AppRoutes.addMedication),
//         backgroundColor: AppColors.primaryTeal,
//         child: const Icon(Icons.add, color: AppColors.white, size: 28),
//       ),
//       body: Column(
//         children: [
//           // Deep Teal Top Header
//           Container(
//             padding: const EdgeInsets.fromLTRB(20, 52, 20, 24),
//             decoration: const BoxDecoration(
//               color: AppColors.primaryTeal,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(24),
//                 bottomRight: Radius.circular(24),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Monday, Nov 23',
//                       style: TextStyle(
//                         color: AppColors.white.withOpacity(0.8),
//                         fontSize: 13,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     const Text(
//                       'Good Morning, Muhammad',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const CircleAvatar(
//                   radius: 22,
//                   backgroundColor: AppColors.softMint,
//                   child: Text(
//                     'MF',
//                     style: TextStyle(
//                       color: AppColors.darkTeal,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Today's Medications Section
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Today's Medications",
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.textDark,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Expanded(
//                     child: Obx(
//                       () => ListView.separated(
//                         padding: const EdgeInsets.only(bottom: 80),
//                         itemCount: controller.medications.length,
//                         separatorBuilder: (_, __) => const SizedBox(height: 12),
//                         itemBuilder: (context, index) {
//                           final med = controller.medications[index];
//                           return Container(
//                             padding: const EdgeInsets.all(14),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               borderRadius: BorderRadius.circular(16),
//                               border: Border.all(color: AppColors.borderGrey),
//                             ),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.lightMintBg,
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: const Icon(
//                                     Icons.medication_rounded,
//                                     color: AppColors.primaryTeal,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 14),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         med.name,
//                                         style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                           color: AppColors.textDark,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 3),
//                                       Text(
//                                         '${med.dosage} • ${med.mealTiming}',
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                           color: AppColors.textGrey,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         med.time,
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: AppColors.primaryTeal,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () =>
//                                       controller.toggleMedicationTaken(med.id),
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 12, vertical: 6),
//                                     decoration: BoxDecoration(
//                                       color: med.isTaken
//                                           ? AppColors.successGreenBg
//                                           : AppColors.lightMintBg,
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: Text(
//                                       med.isTaken ? 'Taken ✓' : 'Take',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                         color: med.isTaken
//                                             ? AppColors.successGreen
//                                             : AppColors.primaryTeal,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
