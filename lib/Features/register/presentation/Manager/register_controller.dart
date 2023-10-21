
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:shop_app/Core/const/app_message.dart';

import '../views/register_codes.dart';

class RegisterController extends GetxController{

  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();


  userRegisterToAcademy(String academy) async {

    if(nameController.text.length>1&&phoneController.text.length>2){
      String randomString = randomAlphaNumeric(10);
      DateTime currentDate = DateTime.now();

      print(randomString);
      await FirebaseFirestore.instance.collection('academy_register').add({
        'name': nameController.text,
        'phone':phoneController.text,
        'academy':academy,
        'date':currentDate,
        'code':randomString,
        'email':"test@gmail.com"
      }).then((value) {
        print("Done");
        Get.to(const RegisterCodesView());
      });
    }
    else{
      appMessage(text: 'enterValidData'.tr);
    }

  }


}