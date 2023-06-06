// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ichiraku/Controller/cart_controller.dart';
import 'package:ichiraku/pages/home/main_foodpage.dart';
import 'package:ichiraku/utils/app_constants.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:ichiraku/Controller/cart_controller.dart';
// import 'package:ichiraku/utils/app_constants.dart';
import 'package:ichiraku/utils/colors.dart';
import 'package:ichiraku/utils/dimensions.dart';
import 'package:ichiraku/widgets/app_icon.dart';
import 'package:ichiraku/widgets/big_text.dart';
import 'package:ichiraku/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconcolor: Colors.white,
                    backgroundcolor: AppColors.iconColor1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(
                      icon: Icons.home_sharp,
                      iconcolor: Colors.white,
                      backgroundcolor: AppColors.iconColor1,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconcolor: Colors.white,
                    backgroundcolor: AppColors.iconColor1,
                  ),
                ],
              )),
          Positioned(
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
                      return ListView.builder(
                          itemCount: cartController.getItems.length,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.only(top: Dimensions.height15),
                              height: Dimensions.height20 * 6,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  Container(
                                    width: Dimensions.height15 * 7,
                                    height: Dimensions.height15 * 7,
                                    //margin: EdgeInsets.only(
                                    //bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            //AssetImage("assets/images/shoyu.png"),
                                            NetworkImage(AppConstants.BASE_URL +
                                                AppConstants.UPLOAD_URL +
                                                cartController
                                                    .getItems[index].img!),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white,
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
                                                  .getItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: "Masala"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text:
                                                  //"\$ 10.0",
                                                  cartController
                                                      .getItems[index].price
                                                      .toString(),
                                              color: Colors.black54,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.height10,
                                                  bottom: Dimensions.height10,
                                                  left: Dimensions.width10,
                                                  right: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white,
                                              ),
                                              child: Row(children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    //  popularProduct.setQuantity(false);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2),
                                                BigText(
                                                    text:
                                                        "0"), //popularProduct.inCartItems.toString()),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2),
                                                GestureDetector(
                                                  onTap: () {
                                                    // popularProduct.setQuantity(true);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.black87,
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
        ],
      ),
    );
  }
}
