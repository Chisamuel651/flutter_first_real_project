import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utensils/dimension.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';

import '../../utensils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                    BigText(text: "Fufu and Eru"),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // use the wrap widget to draw something for a multiple number of times
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15,)),
                        ),
                        SizedBox(width: Dimensions.height10,),
                        SmallText(text: "4.7"),
                        SizedBox(width: Dimensions.height10,),
                        SmallText(text: "348"),
                        SizedBox(width: 5,),
                        SmallText(text: "comments")
                      ],
                    ),
                    SizedBox(height: Dimensions.height5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: Dimensions.height5,),
                        IconAndTextWidget(icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1),
                          SizedBox(width: Dimensions.height100,),
    
                          IconAndTextWidget(icon: Icons.location_on,
                          text: "1.7Km",
                          iconColor: AppColors.mainColor),
                          SizedBox(width: Dimensions.height100,),
    
                          IconAndTextWidget(icon: Icons.access_time_rounded,
                          text: "32mins",
                          iconColor: AppColors.iconColor2),
                          SizedBox(width: Dimensions.height5,)
                      ],
                    )
                  ],
                ),
          ))
        ],
      ),
    );
  }
}