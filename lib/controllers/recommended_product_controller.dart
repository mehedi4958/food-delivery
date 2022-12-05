import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController {
  /// constructor method
  RecommendedProductController({required this.recommendedProductRepo});

  final RecommendedProductRepo recommendedProductRepo;

  List<dynamic> _recommendedProductList = [];
  bool _isLoaded = false;

  /// getter
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
