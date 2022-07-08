import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utensils/dimension.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/expandable_text_widget.dart';

import '../../utensils/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/food1.png"
                  )
                )
              ),
          )),
          // icon widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
          )),
          // introduction
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(

              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Fufu And Eru"),
                    SizedBox(height: Dimensions.height20,),
                    BigText(size: Dimensions.font20, text: "Introduce"),
                    SizedBox(height: Dimensions.height20,),
                    // expandable text widget
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "A Scaffold Widget provides a framework which implements the basic material design visual layout structure of the flutter app. It provides APIs for showing drawers, snack bars and bottom sheets. Have a look at its constructor and the properties it has.A Scaffold Widget provides a framework which implements the basic material design visual layout structure of the flutter app. It provides APIs for showing drawers, snack bars and bottom sheets. Have a look at its constructor and the properties it has.")))

                  ],
                ),
          )),


        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height120,
        padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width15, right: Dimensions.width15),
        decoration: BoxDecoration(
          color: AppColors.buttonBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        // display the icons in the box
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),

              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              child: BigText(text: "1000/meal", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}