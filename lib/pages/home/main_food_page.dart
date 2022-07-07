// import 'package:flutter/cupertino.dart';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utensils/colors.dart';
import 'package:flutter_application_1/utensils/dimension.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';


import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({ Key? key }) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print("The current height is "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
              // header section
              Container(
              // scrolling parameter

              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Cameroon", color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Yaounde", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded, size: Dimensions.iconSize24)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      // this section is for the search button section
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      // default size of an icon is 24
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

              // body section
              Expanded(child: SingleChildScrollView(
                child: FoodPageBody(),
                )
              ),
        ],
      ),
    );
  }
}