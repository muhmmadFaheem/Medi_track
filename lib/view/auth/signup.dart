import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/constant/app_colors.dart';
import 'package:medi_track/constant/app_strings.dart';
import 'package:medi_track/controller/auth_controller/auth_controller.dart';
import 'package:medi_track/widgets/button.dart';
import 'package:medi_track/widgets/textfields.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: AppColors.textDark)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.signupTitle, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 24),
            CustomTextField(controller: controller.nameCtrl, hintText: "Full Name (e.g. Muhammad Al-Rashidi)"),
            const SizedBox(height: 16),
            CustomTextField(controller: controller.emailCtrl, hintText: AppStrings.emailHint),
            const SizedBox(height: 16),
            CustomTextField(controller: controller.passCtrl, hintText: AppStrings.passHint, obscureText: true),
            const SizedBox(height: 28),
            CustomButton(text: "Create Account", onPressed: controller.signup),
          ],
        ),
      ),
    );
  }
}
