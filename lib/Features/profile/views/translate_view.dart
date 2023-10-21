



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Core/loalization/locale_controller.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Features/Home/presentation/views/main_home.dart';

import '../../../Core/resources/color_manager.dart';
import '../../../Core/widgets/Custom_Text.dart';

class TranlsateView extends StatelessWidget {
  const TranlsateView({super.key});

  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    final controller=Get.put(LocaleController());
    return Scaffold(
      appBar:CustomAppBar('', true, 55),
      body:Column(
        children: [
          const SizedBox(height: 41,),
          InkWell(
            child: ProfileCardWidget(
              icon:Icons.language,
              txt: 'English'
            ),
            onTap:(){
              controller.changeLang('en');
              Get.offAll(const MainHome());
            },
          ),
          InkWell(
            child: ProfileCardWidget(
                icon:Icons.language,
                txt: 'العربية '
            ),
            onTap:(){
              controller.changeLang('ar');
              Get.offAll(const MainHome());
            },
          )
        ],
      ),
    );
  }

  Widget ProfileCardWidget({required IconData icon,required String txt}){

    return Padding(
      padding: const EdgeInsets.only(top:31,left: 18.0,right: 18),
      child: Container(
        height:77,
        decoration:BoxDecoration(
            color:ColorsManager.textColorGreyMode,
            borderRadius:BorderRadius.circular(18)
        ),
        child:Row(
          children: [
            const SizedBox(width: 20,),
            Icon(icon,size:33,color:Colors.blue,),
            const SizedBox(width: 20,),
            Custom_Text(text: txt,fontSize:21,alignment:Alignment.center,),
            const SizedBox(width: 20,),
            const Icon(Icons.arrow_forward_ios,color:Colors.black,
              size:32,
            )
          ],
        ),
      ),
    );
  }
}

