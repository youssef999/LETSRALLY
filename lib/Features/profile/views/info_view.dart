


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/Custom_button.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Core/widgets/custom_textformfield.dart';
import 'package:shop_app/Features/profile/Manager/info_controller.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(InfoController());
    final box=GetStorage();
    String email=box.read('email')??'';

    return Scaffold(
      appBar:CustomAppBar('', true, 55),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 30,),
            Custom_Text(text: 'info'.tr,fontSize:28,
            color:Colors.grey,fontWeight:FontWeight.w700,
            ),
            const SizedBox(height: 11,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('email'.tr,
              style:TextStyle(
                color:ColorsManager.textColorDark,
                fontSize: 18
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(email.tr,
                style:TextStyle(
                    color:ColorsManager.textColorDark,
                    fontSize: 18
                ),
              ),
            ),
            // Custom_Text(text: 'email'.tr,
            //   fontSize: 16,color:Colors.black,
            // ),
            // Custom_Text(text: email,color:ColorsManager.textColorDark,
            // alignment:Alignment.topLeft,
            // fontSize: 22,
            // ),
            const SizedBox(height: 11,),
            const Divider(
              thickness: 1.1,
              color:Colors.blue,
            ),


            const SizedBox(height: 10,),
            Custom_Text(text: 'changePass'.tr,
            fontSize: 28,alignment:Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:
              Container(
                height: 70,
                decoration:BoxDecoration(
                  color:Colors.white,
                  border:Border.all(color:Colors.lightBlue),
                  borderRadius:BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(

                    decoration:InputDecoration(
                      hintText: 'newPass'.tr,
                      labelStyle: const TextStyle(
                        color: Colors.white
                      ),
                    ),


                    controller: controller.newPassController,

                    // type: TextInputType.visiblePassword,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:
              Container(
                height: 70,
                decoration:BoxDecoration(
                    color:Colors.white,
                    border:Border.all(color:Colors.lightBlue),
                    borderRadius:BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(

                    decoration:InputDecoration(
                      hintText: 'confirmPass'.tr,
                      labelStyle: const TextStyle(
                          color: Colors.white
                      ),
                    ),


                    controller: controller.passCheckController,

                    // type: TextInputType.visiblePassword,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: CustomButton(text: 'saveChanges'.tr, onPressed: (){

                controller.updatePassword();

              }, color1:ColorsManager.primary,
                  color2: ColorsManager.textColorLight),
            ),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}



