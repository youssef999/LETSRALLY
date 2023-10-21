import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Core/widgets/custom_button.dart';
import 'package:shop_app/Core/widgets/custom_textformfield.dart';
import 'package:shop_app/Features/auth/presentation/Manager/auth_controller.dart';
import '../../../../Core/widgets/Custom_Text.dart';


class ForgotPassView extends GetView<AuthController> {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.textColorLight,
      appBar:CustomAppBar('', true
          , 55),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 7,),
            SizedBox(
              height: 150,
              child: Image.asset(
                'assets/images/logoX.png',
                fit: BoxFit.contain,
              ),
            ),
            Custom_Text(
                alignment: Alignment.center,
                text: "forgetPassword".tr,
                fontSize: 40,
                color:Colors.black,
                fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Custom_Text(
                  alignment: Alignment.center,
                  text: "forgot2".tr,
                  fontSize: 15,
                  color:Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(21.0),
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
              height: 30,
            ),
            CustomButton(
                text: "sendMail".tr,
                onPressed: () {
                  controller.resetPassword();
                },
                color1: ColorsManager.primary,
                color2: Colors.white),
          ],
        ),
      ),
    );
  }
}
