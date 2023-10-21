


 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/Custom_button.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Core/widgets/custom_textformfield.dart';
import 'package:shop_app/Features/Home/presentation/views/main_home.dart';

import '../../Core/const/app_message.dart';

class ContactView extends StatelessWidget {

   ContactView({super.key});

  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController subController=TextEditingController();
  TextEditingController msgController=TextEditingController();
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar:CustomAppBar('', true
          , 55),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const SizedBox(height: 33,),
            Card(
              color:ColorsManager.primary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Custom_Text(text:
                '${'email'.tr} : Lets.rally2023@gmail.com',
                alignment:Alignment.center,
                  fontSize: 18,
                  color:Colors.white,

                ),
              ),
            ),
            const SizedBox(height: 22,),
            Text("firstName".tr),
            CustomTextFormField(
              controller:firstNameController,
              obx:false,obs: false,color:Colors.black
              , hint: 'firstName'.tr, ontap: (){

            }, type: TextInputType.text,

            ),


            const SizedBox(height: 22,),
            Text("lastName".tr),
            CustomTextFormField(
              controller:lastNameController,
              obx:false,obs: false,color:Colors.black
              , hint: 'lastName'.tr, ontap: (){

            }, type: TextInputType.text,

            ),
            const SizedBox(height: 22,),
            Text("email".tr),
            CustomTextFormField(
              controller:emailController,
              obx:false,obs: false,color:Colors.black
              , hint: 'email'.tr, ontap: (){

            }, type: TextInputType.text,

            ),


            const SizedBox(height: 22,),
            Text("subject".tr),
            CustomTextFormField(
              controller:subController,
              obx:false,obs: false,color:Colors.black
              , hint: 'subject'.tr, ontap: (){

            }, type: TextInputType.text,

            ),

            const SizedBox(height: 22,),
            Text("msg".tr),
            CustomTextFormField(
              max: 6,
              controller:msgController,
              obx:false,obs: false,color:Colors.black
              , hint: 'msg'.tr, ontap: (){

            }, type: TextInputType.text,

            ),
            const SizedBox(height: 20,),
            CustomButton(
              text: 'send'.tr,
              color1:ColorsManager.primary,
              color2: ColorsManager.textColorLight,
              onPressed:(){
                userSendMsg();
              },
            ),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }


  userSendMsg() async {


       if(firstNameController.text.length>1
           &&lastNameController.text.isNotEmpty
           &&msgController.text.isNotEmpty){
         await FirebaseFirestore.instance.collection('products').add({
           'fname': firstNameController.text,
           'lname': lastNameController.text,
           'title':subController.text,
           'msg':msgController.text,
           'email':emailController.text

         }).then((value) {
           print('addddddddd');
           appMessage(text: 'sendDone'.tr);
           Get.offAll(const MainHome());
         });
       }else{
         appMessage(text: 'error'.tr);
       }



   }
}

