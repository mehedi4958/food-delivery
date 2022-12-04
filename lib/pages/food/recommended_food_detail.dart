import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';

import '../../widgets/app_icon.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: BigText(
                    text: 'Chinese Slide',
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: const ExpandableTextWidget(
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
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: '\$12.88 ' + ' X ' + ' 0',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
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
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
        ],
      ),
    );
  }
}
