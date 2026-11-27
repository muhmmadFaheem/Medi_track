import 'package:dio/dio.dart';
import 'package:medi_track/constant/app_strings.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, String>?> searchDrugInfo(String query) async {
    try {
      final response = await _dio.get(
        AppStrings.openFdaBaseUrl,
        queryParameters: {
          'search': 'openfda.brand_name:"$query"+openfda.generic_name:"$query"',
          'limit': 1,
        },
      );

      if (response.statusCode == 200 && response.data['results'] != null) {
        final data = response.data['results'][0];
        return {
          'brandName': (data['openfda']?['brand_name'] as List?)?.first ?? query.toUpperCase(),
          'genericName': (data['openfda']?['generic_name'] as List?)?.first ?? 'Generic Formula',
          'usage': (data['indications_and_usage'] as List?)?.first ?? 'No usage details available.',
          'sideEffects': (data['adverse_reactions'] as List?)?.first ?? 'Consult doctor for side effects.',
          'warnings': (data['warnings'] as List?)?.first ?? 'Keep out of reach of children.',
        };
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
