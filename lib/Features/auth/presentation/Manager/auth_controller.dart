


// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/Core/const/app_message.dart';
import 'package:shop_app/Features/auth/presentation/views/login_view.dart';

import '../../../Home/presentation/views/main_home.dart';


class AuthController extends GetxController {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController checkPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  final ScrollController scrollController = ScrollController();
  bool isEndOfList = false;
  num sellerStockLimit=0;
  final box = GetStorage();

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isEndOfList = true;
    } else {
      isEndOfList = false;
    }
  }

  changePassword() async {
    if (passController.text == checkPassController.text &&
        passController.text.length > 5) {
      try {
        await user!.updatePassword(passController.text.toString());
      } catch (e) {
        print(e);
      }
    } else {
      appMessage(text: 'كلمة المرور غير متطابقة او عددها اقل من 6 ');
    }
  }

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text)
          .then((value) {
            appMessage(text: "checkMail".tr);
        Get.offAll(const LoginView())!
            .then((value) => appMessage(text: "checkMail".tr));
      });
      // Password reset email sent successfully
    } catch (e) {
      appMessage(text: 'ادخل بريد سليم ');
      // Handle any errors that occur during the password reset process
      print('Error sending password reset email: $e');
    }
  }

  userLogin() async {
    if (emailController.text.length > 2 && passController.text.length > 5) {
      try {
        await _auth
            .signInWithEmailAndPassword(
            email: emailController.text, password: passController.text)
            .then((value) async {

          print("val$value");

          getSellerData();

          box.write('email', emailController.text);
          Get.offAll(const MainHome());

        });
      } catch (e) {
        String error = '';
        print(e);
        if (e.toString().contains('The password is invalid')) {
          error = 'wrongPass'.tr;
        } else if (e.toString().contains
          ('There is no user record')) {
          error = 'wrongMail'.tr;
        } else {
          error = 'Something Went Wrong Try Agian ';
        }
        //
        appMessage(text: error);
      }
    } else {
      if (emailController.text.contains('@') == false) {
        appMessage(text: 'wrongMail'.tr);
      }

      if (passController.text.length < 5) {
        appMessage(text: 'wrongPass'.tr);
      }
    }
  }

  userSignUp() async {
    final box = GetStorage();
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      )
          .then((user) async {
        box.write('email', emailController.text);
        box.write('name', nameController.text);
        Get.offAll(const MainHome());
      });
    } catch (e) {
      print(e);
    }
  }

  addSellerToFireBase() async {
    await FirebaseFirestore.instance
        .collection('sellers').add({

      'email':emailController.text,
      'name':nameController.text,

    }).then((value) {
    });
  }


  Future<void> getSellerData() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance
        .collection('sellers')
        .where('email',
        isEqualTo: emailController.text)
        .get();
    List<Map<String, dynamic>> data


    = querySnapshot.docs.map((DocumentSnapshot doc)
    => doc.data() as Map<String, dynamic>).toList();
    sellerStockLimit= data[0]['limit'];
    box.write('limit', sellerStockLimit);
    box.write('name', data[0]['name']);
    box.write('code', data[0]['code']);
    print("////");
    print(data[0]['code']);
    print("Limit===$sellerStockLimit");
  }
}
