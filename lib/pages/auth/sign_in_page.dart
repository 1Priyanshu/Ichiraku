// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ichiraku/pages/auth/sign_up_page.dart';
import 'package:ichiraku/routes/route_helper.dart';
import 'package:ichiraku/utils/colors.dart';
import 'package:ichiraku/utils/dimensions.dart';
import 'package:ichiraku/widgets/app_text_field.dart';
import 'package:ichiraku/widgets/big_text.dart';
import '../../Controller/auth_controller.dart';
import '../../base/custom_snackbar.dart';
import '../../models/sign_up_body.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login(AuthController authController) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty) {
      showCustomSnackBar("Type your email address", title: "Email address");
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar("Type your valid email address",
          title: "Valid email address");
    } else if (password.isEmpty) {
      showCustomSnackBar("Type in your password", title: "password");
    } else if (password.length < 6) {
      showCustomSnackBar("Password can not be less than six characters",
          title: "Password");
    } else {
      authController.login(email, password).then((status) {
        if (status.isSuccess) {
          print("Successful registration");
          Get.toNamed(RouterHelper.getInitial());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/ramen.png"),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20),
                child: Column(
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: Dimensions.font30 * 2,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp,
                isObscure: true,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(
                    text: TextSpan(
                      text: "Sign in to your account",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  _login(authController);
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.iconColor1,
                  ),
                  child: Center(
                    child: BigText(
                      text: "Login",
                      size: Dimensions.font30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              RichText(
                text: TextSpan(
                  text: "Don\'t have an account?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => SignUpPage(),
                            transition: Transition.fadeIn),
                      text: " Create",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
