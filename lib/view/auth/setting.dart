// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
// import '../controllers/home_controller.dart';

// class SettingsView extends StatelessWidget {
//   SettingsView({super.key});
//   final controller = Get.find<HomeController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryTeal,
//         foregroundColor: AppColors.white,
//         title: const Text('Settings',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(20),
//         children: [
//           // Profile Card
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: AppColors.borderGrey),
//             ),
//             child: const Row(
//               children: [
//                 CircleAvatar(
//                   radius: 26,
//                   backgroundColor: AppColors.primaryTeal,
//                   child: Text(
//                     'MF',
//                     style: TextStyle(
//                       color: AppColors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 14),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Muhammad Faheem',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: AppColors.textDark,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'Patient ID: #MT-9042',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: AppColors.textGrey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Language / اللغة Toggle
//           Obx(
//             () => _buildSettingTile(
//               icon: Icons.language_rounded,
//               title: 'Language / اللغة',
//               subtitle:
//                   controller.isArabic.value ? 'العربية (Gulf)' : 'English (US)',
//               trailing: Switch(
//                 value: controller.isArabic.value,
//                 activeColor: AppColors.primaryTeal,
//                 onChanged: (val) => controller.isArabic.value = val,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),

//           _buildSettingTile(
//             icon: Icons.emergency_share_rounded,
//             title: 'Caregiver Emergency Alert',
//             subtitle: 'Notify family if a critical dose is missed',
//             trailing: const Icon(Icons.chevron_right, color: AppColors.textGrey),
//           ),
//           const SizedBox(height: 12),

//           _buildSettingTile(
//             icon: Icons.picture_as_pdf_rounded,
//             title: 'Export Health Report (PDF)',
//             subtitle: 'Download adherence & drug log for your doctor',
//             trailing: const Icon(Icons.download_rounded,
//                 color: AppColors.primaryTeal),
//           ),
//           const SizedBox(height: 12),

//           _buildSettingTile(
//             icon: Icons.verified_user_outlined,
//             title: 'Clinical Disclaimer',
//             subtitle: 'Biotech & pharmacology reference standards',
//             trailing: const Icon(Icons.chevron_right, color: AppColors.textGrey),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingTile({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required Widget trailing,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: AppColors.borderGrey),
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.zero,
//         leading: Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: AppColors.lightMintBg,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Icon(icon, color: AppColors.primaryTeal, size: 22),
//         ),
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//             color: AppColors.textDark,
//           ),
//         ),
//         subtitle: Text(
//           subtitle,
//           style: const TextStyle(fontSize: 12, color: AppColors.textGrey),
//         ),
//         trailing: trailing,
//       ),
//     );
//   }
// }
