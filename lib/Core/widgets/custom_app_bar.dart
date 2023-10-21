


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/color_manager.dart';
import 'Custom_Text.dart';


PreferredSizeWidget CustomAppBar(String text,bool leading,double height){
  return AppBar(
      toolbarHeight: height,
      elevation:0.0,
      backgroundColor:ColorsManager.appBarColor,
      title:Custom_Text(text: text,
        fontSize: 21,color:ColorsManager.textColorLight,
        alignment:Alignment.center,
      ),
      leading:(leading==true)?
      IconButton(onPressed: (){
        Get.back();
      }, icon: Icon(Icons.arrow_back_ios,size: 28,
        color:ColorsManager.iconColor2,
      ))
          :const SizedBox()
  );
}