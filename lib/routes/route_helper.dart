import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => initial;
  static String getPopularFood() => popularFood;
  static String getRecommended() => recommendedFood;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () {
        return const MainFoodPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: popularFood,
      page: () {
        return const PopularFoodDetail();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        return const RecommendedFoodDetail();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
