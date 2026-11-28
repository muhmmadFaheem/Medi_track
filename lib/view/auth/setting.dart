import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/constant/app_colors.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final isArabic = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryTeal, centerTitle: true, title: const Text("Settings", style: TextStyle(color: Colors.white))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Patient Profile Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const Row(
                  children: [
                    CircleAvatar(radius: 24, backgroundColor: AppColors.lightMintBg, child: Text("MA", style: TextStyle(color: AppColors.primaryTeal, fontWeight: FontWeight.bold))),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Muhammad Al-Rashidi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("Patient ID: MR-00421", style: TextStyle(color: AppColors.textGrey, fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.dangerRedBg, borderRadius: BorderRadius.circular(20)),
                      child: const Text("Blood Group: B+", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(20)),
                      child: const Text("Known Allergies: Penicillin", style: TextStyle(color: AppColors.warningAmber, fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Language RTL Toggle
          const Text("PREFERENCES", style: TextStyle(color: AppColors.textGrey, fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Obx(() => SwitchListTile(
                  secondary: const Icon(Icons.translate, color: AppColors.primaryTeal),
                  title: const Text("Language / اللغة", style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(isArabic.value ? "Arabic (RTL) enabled" : "English (LTR) enabled"),
                  value: isArabic.value,
                  activeColor: AppColors.primaryTeal,
                  onChanged: (val) {
                    isArabic.value = val;
                    Get.updateLocale(val ? const Locale('ar', 'AE') : const Locale('en', 'US'));
                  },
                )),
          ),
          const SizedBox(height: 20),

          // Caregiver & Report
          const Text("CAREGIVER & REPORTS", style: TextStyle(color: AppColors.textGrey, fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications_active_outlined, color: AppColors.primaryTeal),
                  title: const Text("Caregiver Emergency Alert", style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: const Text("Dr. Fatima Hassan — +971 50 123 4567"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Get.snackbar("Caregiver Alert", "Emergency contact configured"),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.picture_as_pdf_outlined, color: AppColors.primaryTeal),
                  title: const Text("Export Health Report (PDF)", style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: const Text("Last export: 12 June 2025"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Get.snackbar("PDF Export", "Generating medication adherence report..."),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Clinical Disclaimer
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.verified_user_outlined, color: AppColors.primaryTeal),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Clinical Disclaimer: This app is for informational purposes only and does not replace professional medical advice. Always consult a licensed healthcare provider.",
                    style: TextStyle(color: AppColors.textGrey, fontSize: 12, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
