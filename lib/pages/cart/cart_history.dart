import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemPerOrder = {};
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> orderTimes = cartOrderTimeToList();

    var saveCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.maxFinite,
            padding: const EdgeInsets.only(top: 45),
            color: AppColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                BigText(
                  text: 'Cart History',
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
