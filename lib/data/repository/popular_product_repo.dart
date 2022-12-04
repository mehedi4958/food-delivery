import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  /// constructor method
  PopularProductRepo({required this.apiClient});

  final ApiClient apiClient;

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
