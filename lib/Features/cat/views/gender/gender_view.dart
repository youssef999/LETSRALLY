


 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/Custom_button.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Features/cat/manager/cat_controller.dart';

import 'cat_academy_view.dart';

class GenderView extends GetView<CatController> {
  const GenderView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:CustomAppBar('', true, 55),
      body:Column(children: [
        const SizedBox(height: 22,),
        Custom_Text(text: 'gender'.tr,
        color:ColorsManager.textColorDark,
           fontSize: 25,
        ),
        const SizedBox(height: 11,),
        GetBuilder<CatController>(
          init: CatController(),
          builder: (context) {
            return Column(
              children: [
                RadioListTile(
                  title:  Text('male'.tr),
                  value: 'Male',
                  groupValue: controller.selectedRadioValue,
                  onChanged: (value) {
                    controller.setSelectedRadioValue(value.toString());
                  },
                ),
                RadioListTile(
                  title:  Text('female'.tr),
                  value: 'Female',
                  groupValue: controller.selectedRadioValue,
                  onChanged: (value) {
                    controller.setSelectedRadioValue(value.toString());
                  },
                ),
                RadioListTile(
                  title:  Text('both'.tr),
                  value: 'Both',
                  groupValue: controller.selectedRadioValue,
                  onChanged: (value) {
                    controller.setSelectedRadioValue(value.toString());
                  },
                ),
              ],
            );
          }
        ),
        const SizedBox(height: 11,),
        CustomButton(text: 'next'.tr,
            onPressed:(){
          print(controller.selectedRadioValue);

          Get.to(CatAcademyView(
            cat: controller.selectedRadioValue,
          ));

            }, color1: ColorsManager.buttonColor
            , color2: ColorsManager.buttonColor2)

      ],),
    );
  }
}
