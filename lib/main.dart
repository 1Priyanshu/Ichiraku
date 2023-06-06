// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ichiraku/pages/cart/cart_page.dart';
import 'package:ichiraku/pages/food/popular_food_detail.dart';
import 'package:ichiraku/pages/home/main_foodpage.dart';
import 'package:get/get.dart';
import 'package:ichiraku/routes/route_helper.dart';
import 'Controller/popular_product_controller.dart';
import 'Controller/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Canteen App Ichiraku',
      home: MainFoodPage(),
      initialRoute: RouterHelper.initial,
      getPages: RouterHelper.routes,
    );
  }
}
