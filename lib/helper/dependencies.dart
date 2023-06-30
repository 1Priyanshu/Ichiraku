import 'package:get/get.dart';
import 'package:ichiraku/Controller/auth_controller.dart';
import 'package:ichiraku/Controller/cart_controller.dart';
import 'package:ichiraku/Controller/popular_product_controller.dart';
import 'package:ichiraku/data/api/api_client.dart';
import 'package:ichiraku/data/repository/auth_repo.dart';
import 'package:ichiraku/data/repository/cart_repo.dart';
import 'package:ichiraku/data/repository/popular_product_repo.dart';
import 'package:ichiraku/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/recommended_product_controller.dart';
import '../Controller/user_controller.dart';
import '../data/repository/recommended_product_repo.dart';
import '../data/repository/user_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductrepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductrepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
