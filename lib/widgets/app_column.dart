import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

import '../utensils/colors.dart';
import '../utensils/dimension.dart';
import 'big_text.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: text, size: Dimensions.font26,),
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
                );
  }
}