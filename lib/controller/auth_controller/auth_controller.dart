import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/service/hive_service.dart';

class AuthController extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  void login() async {
    if (emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
      Get.snackbar("Error", "Please enter email and password");
      return;
    }
    await HiveService.saveUser("Muhammad Al-Rashidi", emailCtrl.text.trim());
    Get.offAllNamed('/main');
  }

  void signup() async {
    if (nameCtrl.text.isEmpty || emailCtrl.text.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }
    await HiveService.saveUser(nameCtrl.text.trim(), emailCtrl.text.trim());
    Get.offAllNamed('/main');
  }
}
