import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/constant/app_colors.dart';
import 'package:medi_track/view/auth/home.dart';
import 'package:medi_track/view/auth/setting.dart';
import 'package:medi_track/view/drug_details.dart';

class MainNavController extends GetxController {
  var currentIndex = 0.obs;
}

class MainNavView extends StatelessWidget {
  MainNavView({super.key});
  final navCtrl = Get.put(MainNavController());

  final List<Widget> pages = [
    HomeView(),
    DrugInfoView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: pages[navCtrl.currentIndex.value],
          floatingActionButton: navCtrl.currentIndex.value == 0
              ? FloatingActionButton(
                  backgroundColor: AppColors.primaryTeal,
                  onPressed: () => Get.toNamed('/add-med'),
                  child: const Icon(Icons.add, color: Colors.white),
                )
              : null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navCtrl.currentIndex.value,
            onTap: (index) => navCtrl.currentIndex.value = index,
            selectedItemColor: AppColors.primaryTeal,
            unselectedItemColor: AppColors.textGrey,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.medication_outlined), label: "My Meds"),
              BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: "Drug Info"),
              BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Settings"),
            ],
          ),
        ));
  }
}
