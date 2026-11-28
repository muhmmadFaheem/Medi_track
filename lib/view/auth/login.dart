import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/constant/app_colors.dart';
import 'package:medi_track/constant/app_strings.dart';
import 'package:medi_track/controller/auth_controller/auth_controller.dart';
import 'package:medi_track/widgets/button.dart';
import 'package:medi_track/widgets/textfields.dart';


class LoginView extends StatelessWidget {
  LoginView({super.key});
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.health_and_safety, size: 54, color: AppColors.primaryTeal),
              const SizedBox(height: 16),
              const Text(AppStrings.loginTitle, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textDark)),
              const SizedBox(height: 6),
              const Text("Sign in to manage your daily medications", style: TextStyle(color: AppColors.textGrey)),
              const SizedBox(height: 30),
              CustomTextField(controller: controller.emailCtrl, hintText: AppStrings.emailHint, prefixIcon: const Icon(Icons.email_outlined)),
              const SizedBox(height: 16),
              CustomTextField(controller: controller.passCtrl, hintText: AppStrings.passHint, obscureText: true, prefixIcon: const Icon(Icons.lock_outline)),
              const SizedBox(height: 24),
              CustomButton(text: "Sign In", onPressed: controller.login),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () => Get.toNamed('/signup'),
                  child: const Text("Don't have an account? Create Profile", style: TextStyle(color: AppColors.primaryTeal, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
