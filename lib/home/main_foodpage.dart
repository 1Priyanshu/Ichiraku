import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichiraku/home/food_page_body.dart';
import 'package:ichiraku/utils/colors.dart';
import 'package:ichiraku/widgets/big_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Column(
                //   children: [
                //     BigText(text: "Ichiraku", color: AppColors.iconColor1, size: 30),
                //   ],
                // ),
                Center(
                  child: Text(
                    "Ichiraku", 
                    style: TextStyle(color: AppColors.iconColor1, fontSize: 30),
                  ) ,
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 243, 33, 79),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        FoodPageBody(),
      ],
    ));
  }
}
