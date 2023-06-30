import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ichiraku/Controller/auth_controller.dart';
import 'package:ichiraku/base/custom_snackbar.dart';
import 'package:ichiraku/models/sign_up_body.dart';
import 'package:ichiraku/routes/route_helper.dart';
import 'package:ichiraku/utils/colors.dart';
import 'package:ichiraku/utils/dimensions.dart';
import 'package:ichiraku/widgets/app_text_field.dart';
import 'package:ichiraku/widgets/big_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _registration(AuthController authController) {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty) {
      showCustomSnackBar("Type your name", title: "Name");
    } else if (phone.isEmpty) {
      showCustomSnackBar("Type your phone No.", title: "Phone number");
    } else if (email.isEmpty) {
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
      SignUpBody signUpBody = SignUpBody(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );
      authController.registration(signUpBody).then((status) {
        if (status.isSuccess) {
          print("Successful registration");
          Get.offNamed(RouterHelper.getInitial());
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
        body: GetBuilder<AuthController>(
          builder: (_authController) {
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
                  SizedBox(height: Dimensions.height30),
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
                  AppTextField(
                    textController: nameController,
                    hintText: "Name",
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AppTextField(
                    textController: phoneController,
                    hintText: "Phone",
                    icon: Icons.phone,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _registration(_authController);
                    },
                    child: Container(
                      width: Dimensions.screenWidth / 2,
                      height: Dimensions.screenHeight / 13,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        color: AppColors.iconColor1,
                      ),
                      child: Center(
                        child: BigText(
                          text: "Sign up",
                          size: Dimensions.font30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  //to Login Page
                  RichText(
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                      text: "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.05,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
