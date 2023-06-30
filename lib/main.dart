// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ichiraku/Controller/cart_controller.dart';
import 'package:ichiraku/pages/auth/sign_in_page.dart';
import 'package:ichiraku/pages/auth/sign_up_page.dart';
import 'package:ichiraku/pages/cart/cart_page.dart';
import 'package:ichiraku/pages/food/popular_food_detail.dart';
import 'package:ichiraku/pages/home/main_foodpage.dart';
import 'package:get/get.dart';
import 'package:ichiraku/pages/splash/splash.dart';
import 'package:ichiraku/routes/route_helper.dart';
import 'Controller/popular_product_controller.dart';
import 'Controller/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Canteen App Ichiraku',
              initialRoute: RouterHelper.getSplashPage(),
              getPages: RouterHelper.routes,
            );
          },
        );
      },
    );
  }
}
