



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
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
          const SizedBox(height: 40,),
          Custom_Text(text: 'changeLang'.tr,
          color:ColorsManager.primary,
            fontSize: 22,fontWeight:FontWeight.w600,
          ),
          const SizedBox(height: 51,),
          ProfileMenu(
            icon: "assets/images/arabic.svg",
            text: 'العربية ',
            press: () {
              controller.changeLang('ar');
              Get.offAll(const MainHome());

            },
          ),
          const SizedBox(height: 6,),
          ProfileMenu(
            icon: "assets/images/english-11.svg",
            text: 'English',
            press: () {
              controller.changeLang('en');
              Get.offAll(const MainHome());

            },
          ),
          // InkWell(
          //   child: ProfileCardWidget(
          //       icon:LineIcons.values['arabic']!,
          //     txt: 'English'
          //   ),
          //   onTap:(){
          //     controller.changeLang('en');
          //     Get.offAll(const MainHome());
          //   },
          // ),
          // InkWell(
          //   child: ProfileCardWidget(
          //       icon:LineIcons.values['instagram']!,
          //       txt: 'العربية '
          //   ),
          //   onTap:(){
          //     controller.changeLang('ar');
          //     Get.offAll(const MainHome());
          //   },
          // )
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


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key ? key,
    @required this.text,
    @required this.icon,
    @required this.press,
    Null Function()? onpress,
  }) : super(key: key);
  final String ? text, icon;
  final VoidCallback ? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Container(
        height: 70,
        decoration:BoxDecoration(
          color:Colors.grey[300],
          borderRadius:BorderRadius.circular(16)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child:
        InkWell(
          child: Row(
            children: [
              SvgPicture.asset(
                  icon!,
                  width: 27,
                  color: ColorsManager.primary
              ),
              const SizedBox(width: 33),
              Expanded(
                  child: Text(
                    text!,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )),
              // Icon(Icons.arrow_forward_ios)
            ],
          ),
          onTap:press,
        ),
      ),
    );
  }
}

