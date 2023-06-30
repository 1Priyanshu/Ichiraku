import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.67;
  static double pageViewContainer = screenHeight / 3.6;
  static double pageViewTextContainer = screenHeight / 7.85;
  //dynamic height
  static double height10 = screenHeight / 84;
  static double height15 = screenHeight / 56.2;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.2;
  static double height45 = screenHeight / 18.7;
  static double height80 = screenHeight / 10;

  //dynamic width
  static double width10 = screenHeight / 84;
  static double width15 = screenHeight / 56.2;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.2;
  static double width35 = screenHeight / 24.1;
  static double width45 = screenHeight / 18.7;

  //fonts and radiusborder
  static double font16 = screenHeight / 52.7;
  static double font20 = screenHeight / 42.5;
  static double font30 = screenHeight / 28.9;
  static double radius15 = screenHeight / 56.2;
  static double radius20 = screenHeight / 42.5;
  static double radius30 = screenHeight / 28.2;

  //icon
  static double iconSize24 = screenHeight / 35.1;
  static double iconSize16 = screenHeight / 52.71;
  static double iconSize20 = screenHeight / 44.6;

  //ListView
  static double listViewImgSize = screenWidth / 3.5;
  static double listViewTxtContSize = screenWidth / 3.9;

  //popular food page
  static double popularFoodImgSize = screenHeight / 2.8;

  //bottom height
  static double bottomHeightbar = screenHeight / 6.5;
}
