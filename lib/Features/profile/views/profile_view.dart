


 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Features/profile/views/translate_view.dart';
import 'package:shop_app/Features/register/presentation/views/register_codes.dart';
import 'package:shop_app/Features/splash/splash_view.dart';

import 'info_view.dart';

class ProfileView extends StatelessWidget {

  bool check;
  ProfileView({super.key,required this.check});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:
      (check==true)?
          CustomAppBar('', true, 55)
          :CustomAppBar('', false, 3),
      body:Column(
        children: [
          const SizedBox(height: 55,),
          InkWell(
            child: ProfileCardWidget(
              icon:Icons.sentiment_very_satisfied,
              txt: 'account'.tr
              ),
            onTap:(){
              Get.to(const InfoView());
            },
          ),

          InkWell(
            child: ProfileCardWidget(
                icon:Icons.subscriptions,
                txt: 'myReg'.tr
            ),
            onTap:(){
              Get.to(const RegisterCodesView());
            },
          ),

          InkWell(
            child: ProfileCardWidget(
                icon:Icons.translate,
                txt: 'lang'.tr
            ),
            onTap:(){
              Get.to(const TranlsateView());
            },
          ),

          InkWell(
            child: ProfileCardWidget(
                icon:Icons.logout,
                txt: 'logout'.tr
            ),onTap:(){
              final box=GetStorage();
              box.remove('email');
              Get.offAll(const SplashView());
          },
          ),

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
