// import 'package:flutter/cupertino.dart';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utensils/colors.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_text_widget.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

import '../../utensils/dimension.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({ Key? key }) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _CurrPageValue = 0.0;
  double _scaleFactor = 0.0;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _CurrPageValue = pageController.page!;
        // print("current value is"+ _CurrPageValue.toString());
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SLIDER SECTION
        Container(

          // color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
        ),

        // DOTS SECTION
        new DotsIndicator(
            dotsCount: 5,
            position: _CurrPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          )
        ),

        // POPULAR TEXT
        // sizedbox helps in creating space between content
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            // crossAxisAlignement used to render the writings on same line
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color:Colors.black26),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing",),
              )
            ],
          ),
        ),
        
        // list of food and images::
          // height: 700, placed in a container inorder to have a view      
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                // use ; when returning
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      // image display section
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/food1.png"
                            )
                          )
                        ),
                      ),
                      
                      // text display section
                      // expanded widget makes sure content occupies the whole width
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextConSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: Colors.white,
                          ),

                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Fufu Corn And Vegetable"),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: "Traditional Meal Of Many anglophone Tribes"),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: Dimensions.height10,),
                                    IconAndTextWidget(icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1),
                                      SizedBox(width: Dimensions.height10,),
                
                                      IconAndTextWidget(icon: Icons.location_on,
                                      text: "1.7Km",
                                      iconColor: AppColors.mainColor),
                                      SizedBox(width: Dimensions.height10,),
                
                                      IconAndTextWidget(icon: Icons.access_time_rounded,
                                      text: "32mins",
                                      iconColor: AppColors.iconColor2)
                                  ],
                                )  
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            ),
      ],
    );
  }
  // declare function _buildPageItem
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _CurrPageValue.floor()){
      var currScale = 1-(_CurrPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      // matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    // else if(index==_CurrPageValue.floor()+1){
    //   var currScale = _scaleFactor + (_CurrPageValue-index+1)*(1-_scaleFactor);
    //   var currTrans = _height*(1-currScale)/2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    // }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
    
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/food1.png"
                )
              )
            ),
          ),
    
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(text: "Ripe Plantain And Koki"),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: Dimensions.height10,),
                        IconAndTextWidget(icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1),
                          SizedBox(width: Dimensions.height10,),
    
                          IconAndTextWidget(icon: Icons.location_on,
                          text: "1.7Km",
                          iconColor: AppColors.mainColor),
                          SizedBox(width: Dimensions.height10,),
    
                          IconAndTextWidget(icon: Icons.access_time_rounded,
                          text: "32mins",
                          iconColor: AppColors.iconColor2)
                      ],
                    )
                  ],
                ),
              ),
            ),

          )
    
        ],
      ),
    );
  }
}