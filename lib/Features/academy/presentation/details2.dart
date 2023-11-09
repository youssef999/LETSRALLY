

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/Custom_button.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';

import '../../register/presentation/views/register_view.dart';

class AcademyDetailsView2 extends StatelessWidget {
  DocumentSnapshot posts;

  AcademyDetailsView2({super.key,required this.posts});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar('', true, 44),
      body:ListView(
        children: [
          const SizedBox(height: 1,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color:Colors.black,
                  borderRadius:BorderRadius.circular(33)
              ),
              //height: 300,
              //  width:200,
              height: 321,
              child:Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.network(posts['image'],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 21,),
          Custom_Text(text: posts['name'],
            fontWeight:FontWeight.bold,
            color:ColorsManager.textColorDark,
            fontSize:26,alignment:Alignment.center,
          ),
          const SizedBox(height: 13,),
          // (posts['details']==null)?
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Custom_Text(text: posts['details'],
          //     color:ColorsManager.textColorDark,
          //     fontSize:18,alignment:Alignment.center,
          //   ),
          // ):
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Custom_Text(text: posts['des'],
              color:ColorsManager.textColorDark,
              fontSize:18,alignment:Alignment.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left:38.0,right: 32,top:13,bottom: 11),
            child: CustomButton(text: 'reg'.tr, onPressed: (){
              Get.to(RegisterView(
                academy: posts['name'],
              ));
            }, color1: ColorsManager.buttonColor, color2: ColorsManager.buttonColor2),
          ),
          const SizedBox(height: 13,),
        ],
      ),
    );
  }
}
