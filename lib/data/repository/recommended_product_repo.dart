import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  /// constructor method
  RecommendedProductRepo({required this.apiClient});

  final ApiClient apiClient;

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
