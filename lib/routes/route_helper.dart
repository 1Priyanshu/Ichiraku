// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:get/get.dart';
import 'package:ichiraku/pages/auth/sign_in_page.dart';
import 'package:ichiraku/pages/cart/cart_page.dart';
import 'package:ichiraku/pages/food/popular_food_detail.dart';
import 'package:ichiraku/pages/food/recommended_food_detail.dart';
import 'package:ichiraku/pages/home/main_foodpage.dart';
import 'package:ichiraku/pages/splash/splash.dart';

import '../pages/home/home_page.dart';

class RouterHelper {
  static const String splashPage = "/splash-page";
  static String getSplashPage() => '$splashPage';
  static const String initial = "/";
  static String getInitial() => '$initial';
  static const String popularFood = "/popular-food";
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static const String recommendedFood = "/recommended-food";
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static const String cartPage = "/cart-page";
  static String getCartPage() => '$cartPage';
  static const String signIn = "/sign-in";
  static String getSignInPage() => '$signIn';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: signIn, page: () => SignInPage(), transition: Transition.fadeIn),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
