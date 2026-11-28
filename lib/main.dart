import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/bottom_navigation/bottom_navigationbar.dart';
import 'package:medi_track/constant/app_colors.dart';
import 'package:medi_track/service/hive_service.dart';
import 'package:medi_track/service/notification_service/notification_service.dart';
import 'package:medi_track/view/add_medicine.dart';
import 'package:medi_track/view/auth/login.dart';
import 'package:medi_track/view/auth/signup.dart';
import 'package:medi_track/view/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await NotificationService.init();
  runApp(const MediTrackApp());
}

class MediTrackApp extends StatelessWidget {
  const MediTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MediTrack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryTeal,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/splash',
      getPages: [
       GetPage(name: '/splash', page: () => SplashView()),
       GetPage(name: '/login', page: () => LoginView()),
       GetPage(name: '/signup', page: () => SignupView()),
       GetPage(name: '/main', page: () => MainNavView()),
       GetPage(name: '/add-med', page: () => AddMedicationView()),
      ],
    );
  }
}
