


 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Features/Home/presentation/views/main_home.dart';
import 'package:shop_app/Features/auth/presentation/views/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    final box=GetStorage();
    String email=box.read('email')??"x";
    Future.delayed(const Duration(seconds: 3)).then((value) {

      if(email=='x'){
        Get.offAll(const LoginView());
      }else{
        Get.offAll(const MainHome());
      }

    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:CustomAppBar('', false, 4),
      body:Center(
        child:Padding(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
              height: 260,
              child: Image.asset('assets/images/splash.jpeg',
              fit:BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
