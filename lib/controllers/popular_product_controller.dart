import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  /// constructor method
  PopularProductController({required this.popularProductRepo});

  final PopularProductRepo popularProductRepo;

  List<dynamic> _popularProductList = [];
  bool _isLoaded = false;
  int _quantity = 0;
  int _inCartItems = 0;
  late CartController _cart;

  /// getters
  List<dynamic> get popularProductList => _popularProductList;
  bool get isLoaded => _isLoaded;
  int get quantity => _quantity;
  int get inCartItems => _inCartItems + _quantity;
  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        'Item count',
        'You can\'t reduce more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        'Item count',
        'You can\'t add more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print('quantity in the cart is $_inCartItems');
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach(
      (key, value) {
        print('The id is ${value.id} and the quantity is ${value.quantity}');
      },
    );
    update();
  }
}
