import 'package:get/get.dart';
import 'package:ichiraku/Controller/cart_controller.dart';
import 'package:ichiraku/Controller/popular_product_controller.dart';
import 'package:ichiraku/data/api/api_client.dart';
import 'package:ichiraku/data/repository/cart_repo.dart';
import 'package:ichiraku/data/repository/popular_product_repo.dart';
import 'package:ichiraku/utils/app_constants.dart';

import '../Controller/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  //controller
  Get.lazyPut(() => PopularProductController(popularProductrepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductrepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
