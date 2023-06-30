import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ichiraku/Controller/auth_controller.dart';
import 'package:ichiraku/Controller/cart_controller.dart';
import 'package:ichiraku/Controller/user_controller.dart';
import 'package:ichiraku/base/custom_loader.dart';
import 'package:ichiraku/routes/route_helper.dart';
import 'package:ichiraku/utils/colors.dart';
import 'package:ichiraku/utils/dimensions.dart';
import 'package:ichiraku/widgets/app_icon.dart';
import 'package:ichiraku/widgets/big_text.dart';

import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.iconColor1,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return _userLoggedIn
            ? (userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: Dimensions.height45),
                    child: Column(
                      children: [
                        AppIcon(
                          icon: Icons.person,
                          backgroundcolor: AppColors.iconColor1,
                          iconcolor: Colors.white,
                          size: Dimensions.height10 * 10,
                        ),
                        SizedBox(
                          height: Dimensions.height45,
                        ),
                        //profile name
                        AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.person,
                            backgroundcolor: Color.fromARGB(255, 255, 204, 0),
                            iconcolor: Colors.white,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: BigText(text: userController.userModel.name),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        //phone
                        AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.phone,
                            backgroundcolor: Color.fromARGB(255, 255, 204, 0),
                            iconcolor: Colors.white,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText:
                              BigText(text: userController.userModel.phone),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        //email
                        AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.email,
                            backgroundcolor: Color.fromARGB(255, 255, 204, 0),
                            iconcolor: Colors.white,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText:
                              BigText(text: userController.userModel.email),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        //email
                        GestureDetector(
                          onTap: () {
                            if (Get.find<AuthController>().userLoggedIn()) {
                              Get.find<AuthController>().clearSharedData();
                              Get.find<CartController>().clear();
                              Get.find<CartController>().clearCartHistory();
                              Get.offNamed(RouterHelper.getSignInPage());
                            } else {
                              print("you are already logged out");
                            }
                          },
                          child: AccountWidget(
                            appIcon: AppIcon(
                              icon: Icons.logout,
                              backgroundcolor: Color.fromARGB(255, 255, 204, 0),
                              iconcolor: Colors.white,
                              size: Dimensions.height10 * 5,
                            ),
                            bigText: BigText(text: "Logout"),
                          ),
                        ),
                      ],
                    ),
                  )
                : CustomLoader())
            : Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height20 * 8,
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/loginimage.png"))),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouterHelper.getSignInPage());
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 8,
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                          color: AppColors.iconColor1,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Center(
                            child: BigText(
                          text: "Login",
                          color: Colors.white,
                          size: Dimensions.font20,
                        )),
                      ),
                    ),
                  ],
                )),
              );
      }),
    );
  }
}
