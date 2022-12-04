import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:food_delivery/data/api/api_client.dart';

Future<void> init() async {
  /// api client
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://www.dbestech.com'));

  /// repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  /// controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}