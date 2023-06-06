// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:ichiraku/pages/food/popular_food_detail.dart';
import 'package:ichiraku/pages/food/recommended_food_detail.dart';
import 'package:ichiraku/pages/home/main_foodpage.dart';

class RouterHelper {
  static const String initial = "/";
  static String getInitial() => '$initial';
  static const String popularFood = "/popular-food";
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static const String recommendedFood = "/recommended-food";
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
