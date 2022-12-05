import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  /// constructor method
  PopularProductController({required this.popularProductRepo});

  final PopularProductRepo popularProductRepo;

  List<dynamic> _popularProductList = [];
  bool _isLoaded = false;

  /// getter
  List<dynamic> get popularProductList => _popularProductList;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
