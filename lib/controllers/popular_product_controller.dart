import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  /// constructor method
  PopularProductController({required this.popularProductRepo});

  final PopularProductRepo popularProductRepo;

  List<dynamic> _popularProductList = [];

  /// getter
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print(response.body);
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
    } else {
      print('print2');
    }
  }
}
