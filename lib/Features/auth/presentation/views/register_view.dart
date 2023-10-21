

import 'package:flutter/material.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Core/widgets/custom_text.dart';
import 'package:shop_app/Core/widgets/custom_button.dart';
import 'package:shop_app/Core/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:shop_app/Features/auth/presentation/Manager/auth_controller.dart';

import '../../../../../Core/resources/color_manager.dart';
import '../../../Home/presentation/views/main_home.dart';
import 'login_view.dart';

class SignUpView extends GetView<AuthController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar('', true, 50),
      backgroundColor: ColorsManager.textColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [

              Container(
                decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(21),
                    color:ColorsManager.primary
                ),

                height: 160,
                //width: 300,
                child:Image.asset('assets/images/logoX.png',
                  fit:BoxFit.fill,
                ),
              ),
              const SizedBox(height: 11,),
              Custom_Text(text: 'reg'.tr,
                fontSize: 31,fontWeight:FontWeight.w700,
              ),
              const SizedBox(height: 7,),
              Custom_Text(text: 'reg2'.tr,
                fontSize: 16,fontWeight:FontWeight.w500,
              ),

              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                    hint: "email".tr,
                    obx: false,
                    ontap: () {},
                    type: TextInputType.emailAddress,
                    obs: false,
                    color: ColorsManager.textColorDark,
                    controller: controller.emailController),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                    hint: "name".tr,
                    obx: false,
                    ontap: () {},
                    type: TextInputType.text,
                    obs: false,
                    color: ColorsManager.textColorDark,
                    controller: controller.nameController),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                    hint: "password".tr,
                    obx: true,
                    ontap: () {},
                    type: TextInputType.visiblePassword,
                    obs: true,
                    color: ColorsManager.textColorDark,
                    controller: controller.passController),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: "signup".tr,
                  onPressed: () {
                    controller.userSignUp();
                  },
                  color1: ColorsManager.primary,
                  color2: Colors.white),
              const SizedBox(
                height: 12
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custom_Text(
                      text: 'haveAccount'.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Custom_Text(
                      text: 'login'.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: ColorsManager.primary,
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(const LoginView());
                },
              ),
              const SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
