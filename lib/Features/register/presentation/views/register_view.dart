

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/Custom_button.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Core/widgets/custom_textformfield.dart';
import 'package:shop_app/Features/register/presentation/Manager/register_controller.dart';

class RegisterView extends GetView<RegisterController> {

  String academy;
  RegisterView({super.key,required this.academy});

  @override
  Widget build(BuildContext context) {

    Get.put(RegisterController());

    return Scaffold(
      appBar:CustomAppBar('', true, 55),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 21,),
           Custom_Text(text: 'name'.tr),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hint: 'name2'.tr
                  , obx: false, ontap: (){

                  }, type: TextInputType.text
                  , obs: false, color: ColorsManager.textColorDark
                  , controller: controller.nameController),
            ),
            const SizedBox(height: 21,),
            Custom_Text(text: 'phone'.tr),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hint: 'phone2'.tr
                  , obx: false, ontap: (){
                  }, type: TextInputType.phone
                  , obs: false, color: ColorsManager.textColorDark
                  , controller: controller.phoneController),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left:28.0,right: 28),
              child: CustomButton(text: 'reg'.tr, onPressed: (){
                controller.userRegisterToAcademy(
                  academy
                );
              }, color1: ColorsManager.buttonColor,
                  color2: ColorsManager.buttonColor2),
            )
          ],
        ),
      ),
    );
  }
}
