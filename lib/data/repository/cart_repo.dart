import 'dart:convert';

import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  CartRepo({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    /*
     * converts cart objects to string as shared_preferences only accepts string
     */
    // cartList.forEach((element) => cart.add(jsonEncode(element));
    for (var element in cartList) {
      cart.add(jsonEncode(element));
    }
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];
    // carts.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartList;
  }

  void addToCartHistoryList() {
    for (int i = 0; i < cart.length; i++) {
      // print('history list ${cart[i]}');
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
  }

  void removeCart() {
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
