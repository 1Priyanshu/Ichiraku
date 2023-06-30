// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ichiraku/Controller/auth_controller.dart';
import 'package:ichiraku/Controller/cart_controller.dart';
import 'package:ichiraku/Controller/popular_product_controller.dart';
import 'package:ichiraku/base/no_data_page.dart';
import 'package:ichiraku/pages/home/main_foodpage.dart';
import 'package:ichiraku/routes/route_helper.dart';
import 'package:ichiraku/utils/app_constants.dart';
import 'package:ichiraku/utils/colors.dart';
import 'package:ichiraku/utils/dimensions.dart';
import 'package:ichiraku/widgets/app_icon.dart';
import 'package:ichiraku/widgets/big_text.dart';
import 'package:ichiraku/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../Controller/recommended_product_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Align items vertically in the center
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouterHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_sharp,
                    iconcolor: Colors.white,
                    backgroundcolor: AppColors.iconColor1,
                  ),
                ),
                SizedBox(
                    width: Dimensions
                        .width10), // Add some spacing between the home icon and "Cart" text
                BigText(text: "Your Cart")
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimensions.height10),
                      //color: Colors.green,
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                            builder: (cartController) {
                              var _cartList = cartController.getItems;
                              return ListView.builder(
                                  itemCount: _cartList.length,
                                  itemBuilder: (_, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          top: Dimensions.height15),
                                      height: Dimensions.height20 * 6,
                                      width: double.maxFinite,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              var popularIndex = Get.find<
                                                      PopularProductController>()
                                                  .popularProductList
                                                  .indexOf(_cartList[index]
                                                      .product!);
                                              if (popularIndex >= 0) {
                                                Get.toNamed(
                                                    RouterHelper.getPopularFood(
                                                        popularIndex,
                                                        "cartPage"));
                                              } else {
                                                var recommendedIndex = Get.find<
                                                        RecommendedProductController>()
                                                    .recommendedProductList
                                                    .indexOf(_cartList[index]
                                                        .product!);
                                                if (recommendedIndex < 0) {
                                                  Get.snackbar(
                                                      "History product",
                                                      "Product review is not available for history products.");
                                                } else {
                                                  Get.toNamed(RouterHelper
                                                      .getRecommendedFood(
                                                          recommendedIndex,
                                                          "cartPage"));
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: Dimensions.height15 * 7,
                                              height: Dimensions.height15 * 7,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      //AssetImage("assets/images/shoyu.png"),
                                                      NetworkImage(AppConstants
                                                              .BASE_URL +
                                                          AppConstants
                                                              .UPLOAD_URL +
                                                          cartController
                                                              .getItems[index]
                                                              .img!),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width10,
                                          ),
                                          Expanded(
                                              child: Container(
                                            height: Dimensions.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text:
                                                      //"Priyanshu upman",
                                                      cartController
                                                          .getItems[index]
                                                          .name!,
                                                  color: Colors.black54,
                                                ),
                                                SmallText(text: "Masala"),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text:
                                                          //"\$ 10.0",
                                                          cartController
                                                              .getItems[index]
                                                              .price
                                                              .toString(),
                                                      color: Colors.black54,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimensions
                                                              .height10,
                                                          bottom: Dimensions
                                                              .height10,
                                                          left: Dimensions
                                                              .width10,
                                                          right: Dimensions
                                                              .width10),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions
                                                                    .radius20),
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                -1);
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2),
                                                        BigText(
                                                            text: _cartList[
                                                                    index]
                                                                .quantity
                                                                .toString()), //popularProduct.inCartItems.toString()),
                                                        SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2),
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                1);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    );
                                  });
                            },
                          )),
                    ),
                  )
                : NoDataPage(text: "Your cart is empty");
          })
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: Dimensions.bottomHeightbar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 243, 243, 243),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: cartController.getItems.length > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Row(children: [
                        SizedBox(width: Dimensions.width10 / 2),
                        BigText(text: '\u{20B9} ${cartController.totalAmout}'),
                        SizedBox(width: Dimensions.width10 / 2),
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          print("tapped");
                          cartController.addToHistroy();
                        } else {
                          Get.toNamed(RouterHelper.getSignInPage());
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: BigText(
                          text: "Order",
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.iconColor1,
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
        );
      }),
    );
  }
}
