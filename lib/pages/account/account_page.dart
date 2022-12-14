import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const BigText(
          text: 'Profile',
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            /// profile
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(height: Dimensions.height30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: 'Hasan'),
                    ),
                    SizedBox(height: Dimensions.height20),

                    ///phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: '0123456789'),
                    ),
                    SizedBox(height: Dimensions.height20),

                    /// email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: 'a@a.com'),
                    ),
                    SizedBox(height: Dimensions.height20),

                    /// address
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: 'Fill in you address'),
                    ),
                    SizedBox(height: Dimensions.height20),

                    /// message
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: 'Messages'),
                    ),
                    SizedBox(height: Dimensions.height20),

                    /// logout
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSignInPage());
                        } else {
                          print('Logged out');
                        }
                      },
                      child: AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.logout,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: const BigText(text: 'Messages'),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
