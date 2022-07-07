import 'package:get/get.dart';
class Dimensions{
  // .context!. explains that the height cannot be null
  // getx collects the height and width of device and can be used anywhere around the application
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // 914.285/220=4.155 
  static double pageViewContainer = screenHeight/4.155;
  // 914.285/120=7.619
  static double pageViewTextContainer = screenHeight/7.619;
  // 914.285/320=2.85
  static double pageView = screenHeight/2.85;
  // 914.285/10=91.4
  static double height10 = screenHeight/91.4;
  static double height20 = screenHeight/45.7;
  static double height15 = screenHeight/60.9;
  static double height5 = screenHeight/182.8;
  static double height30 = screenHeight/30.46;
  static double height45 = screenHeight/20.31;
  static double height100 = screenHeight/9.31;
  static double height120 = screenHeight/7.61;

  static double font26 = screenHeight/35.2;
  static double font20 = screenHeight/45.7;
  static double radius20 = screenHeight/45.7;
  static double radius30 = screenHeight/30.46;
    static double radius15 = screenHeight/60.9;

  static double width20 = screenHeight/45.7;
  static double width15 = screenHeight/60.9;
  static double width10 = screenHeight/91.4;
  static double width30 = screenHeight/30.46;
  static double width45 = screenHeight/20.31;
  static double width5 = screenHeight/182.8;
  // icon size
  static double iconSize24 = screenHeight/38.08;
  static double iconSize16 = screenHeight/57.12;
  static double iconCircularSize = screenHeight/22.85;

  // list view size
  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextConSize = screenWidth/3.90;

  static double popularFoodImgSize = screenHeight/2.61;

  

}