


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/const/app_message.dart';
import 'package:shop_app/Features/Home/presentation/views/main_home.dart';

class InfoController extends GetxController{

  TextEditingController newPhoneController=TextEditingController();
  TextEditingController passCheckController=TextEditingController();
  TextEditingController newPassController=TextEditingController();


  void updatePassword() async {


    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    print("////");
    print(user);
    print("////");
    if(passCheckController.text==newPassController.text){
      try {
        await user!.updatePassword(newPassController.text);
        print("Password updated successfully.");
        appMessage(text: 'passwordUpdate'.tr);
        Get.offAll(const MainHome());
      } catch (e) {
        print(e);
        print("Error updating password: $e");
      }
    }else{
      appMessage(text: 'passwordUpdate'.tr);
    }

  }


}