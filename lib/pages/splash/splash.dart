import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ichiraku/routes/route_helper.dart';
import 'package:ichiraku/utils/dimensions.dart';

import '../../Controller/popular_product_controller.dart';
import '../../Controller/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouterHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/naruto2.png",
              height: Dimensions.width45 * 10,
            ),
          ),
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/images/ramen.png",
                width: Dimensions.width15 * 10,
              ),
            ),
          ),
          ScaleTransition(
            scale: animation,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/ichiraku.jpg",
                width: Dimensions.width20 * 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
