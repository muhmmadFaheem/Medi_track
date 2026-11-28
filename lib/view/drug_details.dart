import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_track/constant/app_colors.dart';
import 'package:medi_track/constant/app_strings.dart';
import 'package:medi_track/service/api_service.dart';

class DrugInfoController extends GetxController {
  final searchCtrl = TextEditingController();
  final _api = ApiService();
  var isLoading = false.obs;

  var drugData = <String, String>{
    'brandName': 'Ibuprofen 400mg',
    'genericName': 'Ibuprofen | NSAID Class',
    'usage': 'Non-steroidal anti-inflammatory drug (NSAID). Inhibits COX-1 and COX-2 enzymes, reducing prostaglandin synthesis. Used for pain, fever, and inflammation.',
    'sideEffects': 'Nausea, dyspepsia, headache, dizziness. GI irritation with prolonged use. Take with food to reduce discomfort.',
    'warnings': 'Avoid in renal impairment, peptic ulcer disease, or concurrent anticoagulant therapy. Contraindicated in third trimester of pregnancy.',
  }.obs;

  Future<void> searchDrug(String query) async {
    if (query.trim().isEmpty) return;
    isLoading.value = true;
    final res = await _api.searchDrugInfo(query.trim());
    if (res != null) {
      drugData.value = res;
    } else {
      Get.snackbar("Not Found", "No OpenFDA record found for '$query'");
    }
    isLoading.value = false;
  }
}

class DrugInfoView extends StatelessWidget {
  DrugInfoView({super.key});
  final controller = Get.put(DrugInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryTeal, title: const Text("Drug Directory", style: TextStyle(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.searchCtrl,
              onSubmitted: controller.searchDrug,
              decoration: InputDecoration(
                hintText: AppStrings.searchDrugHint,
                prefixIcon: const Icon(Icons.search, color: AppColors.primaryTeal),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator(color: AppColors.primaryTeal));
                }
                final d = controller.drugData;
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(d['brandName']!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(color: AppColors.lightMintBg, borderRadius: BorderRadius.circular(20)),
                              child: const Text("Generic Formula", style: TextStyle(color: AppColors.primaryTeal, fontSize: 12, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Text(d['genericName']!, style: const TextStyle(color: AppColors.textGrey)),
                        const SizedBox(height: 20),
                        _buildSection(AppStrings.mechanismTitle, d['usage']!, AppColors.primaryTeal),
                        _buildSection(AppStrings.sideEffectsTitle, d['sideEffects']!, AppColors.warningAmber),
                        _buildSection(AppStrings.warningsTitle, d['warnings']!, AppColors.dangerRed),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, Color accentColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(border: Border(left: BorderSide(color: accentColor, width: 3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 6),
          Text(content, maxLines: 5, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.textGrey, height: 1.4)),
        ],
      ),
    );
  }
}
