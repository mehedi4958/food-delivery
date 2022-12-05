import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:get/get.dart';

import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  final int pageId;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/food0.png'),
                ),
              ),
            ),
          ),

          /// icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const MainFoodPage());
                  },
                  child: const AppIcon(icon: Icons.arrow_back_ios),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),

          /// introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: 'Chinese Slide'),
                  SizedBox(height: Dimensions.height20),
                  const BigText(text: 'Introduce'),
                  SizedBox(height: Dimensions.height20),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text:
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a'
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a'
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a'
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a'
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a'
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a'
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a'
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a'
                            'ksdjfiefha afked fijsdf lkmcsdeifj;a lsdfmeimfksd dkmcds  ksdjf;iedasdf oisdifaknefa.sdifjaoeifn la kjdhfliuweafnjsd iuewfjanca; jksduhfawe nsdjfleu jnaejrjdnf ljbaerudsa kjhsdfiaefnaefu jndfuebasdbcaakerukjdsfa'
                            'jlkjaheiurwknjadjhfliawefn akweuhrndf'
                            'kjdfakea;eikndfiwef;a',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomBarHeight,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                right: Dimensions.width20,
                left: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: '0'),
                  SizedBox(width: Dimensions.width10 / 2),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                top: Dimensions.height20,
                right: Dimensions.width20,
                bottom: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: const BigText(
                text: '\$10 | Add to cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
