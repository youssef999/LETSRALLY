

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_button.dart';
import '../../Features/Home/presentation/views/main_home.dart';
import 'locale_controller.dart';


class LocalView extends GetWidget<LocaleController> {
  const LocalView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor:ColorsManager.primary,
        leading: InkWell(child: const Icon(Icons.arrow_back_ios,size: 27,color:Colors.white),
          onTap:(){
            Get.back();
          },
        ),
      ),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60,),
            CustomButton(text: 'English', onPressed: (){
              controller.changeLang('en');
              Get.offAll(const MainHome());
            }
                , color1:ColorsManager.primary
                , color2: ColorsManager.textColorLight),

            const SizedBox(height: 30,),

            CustomButton(text: 'العربية ', onPressed: (){
              controller.changeLang('ar');
              Get.offAll(const MainHome());
            }
                , color1:ColorsManager.primary
                , color2: ColorsManager.textColorLight)
          ],
        ),
      ),
    );
  }
}
