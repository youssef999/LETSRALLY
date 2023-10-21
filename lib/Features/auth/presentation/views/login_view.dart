import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Core/widgets/custom_text.dart';
import 'package:shop_app/Core/widgets/custom_button.dart';
import 'package:shop_app/Core/widgets/custom_textformfield.dart';
import 'package:shop_app/Features/auth/presentation/Manager/auth_controller.dart';
import 'package:shop_app/Features/auth/presentation/views/register_view.dart';

import 'forgot_view.dart';


class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar:CustomAppBar('', false, 5),
      //backgroundColor: ColorsManager.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              const SizedBox(height: 30,),
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
              Custom_Text(text: 'appName'.tr,
              fontSize: 31,fontWeight:FontWeight.w700,
              ),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Custom_Text(text: 'sign'.tr,
                  fontSize: 16,fontWeight:FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomTextFormField(
                    hint: 'email'.tr,
                    obx: false,
                    ontap: () {},
                    type: TextInputType.emailAddress,
                    obs: false,
                    color: ColorsManager.textColorDark,
                    controller: controller.emailController),
              ),

              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomTextFormField(
                    hint: 'password'.tr,
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
                  text: 'login'.tr,
                  onPressed: () {
                    controller.userLogin();
                  },
                  color1: ColorsManager.buttonColor,
                  color2: ColorsManager.buttonColor2),

              const SizedBox(
                height: 28,
              ),

              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custom_Text(
                      text: 'forgotPassword'.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Custom_Text(
                      text: 'reset'.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: Colors.grey,
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(const ForgotPassView());
                },
              ),
              const SizedBox(
                height: 17,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custom_Text(
                      text: 'dontHaveAccount'.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Custom_Text(
                      text: 'signup'.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: Colors.blue,
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(const SignUpView());
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
