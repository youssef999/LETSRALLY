import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Features/about_drawer/about_us_view.dart';
import 'package:shop_app/Features/profile/views/profile_view.dart';
import '../../Features/about_drawer/contact.dart';
import '../../Features/about_drawer/privacy.dart';
import '../../Features/about_drawer/terms_view.dart';
import '../../Features/profile/views/translate_view.dart';
import '../../Features/splash/splash_view.dart';
import '../resources/color_manager.dart';
import 'Custom_Text.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer();

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String email = box.read('email') ?? 'x';
    return Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Container(
            height: 20,
            color: ColorsManager.primary,
          ),




                   const SizedBox(height: 16,),
                   InkWell(
                    child: drawerItemWidget(
                      image: 'assets/images/con.webp',
                      txt: 'contact'.tr
                    ),
                     onTap:(){
                      Get.to(ContactView());
                     },
                  ),
                  const SizedBox(height: 16,),
                  InkWell(
                    child: drawerItemWidget(
                        image: 'assets/images/about.jpeg',
                        txt: 'about'.tr
                    ),
                    onTap:(){
                      Get.to(const AboutUsView());
                    },
                  ),
                  const SizedBox(height: 16,),

                  //PrivacyView
                  InkWell(
                    child: drawerItemWidget(
                        image: 'assets/images/privacy.jpeg',
                        txt: 'privacyPolicy'.tr
                    ),
                    onTap:(){
                      Get.to(const PrivacyView());
                    },
                  ),
                  const SizedBox(height: 16,),
                  InkWell(
                    child: drawerItemWidget(
                        image: 'assets/images/terms.jpeg',
                        txt: 'terms'.tr
                    ),
                    onTap:(){
                      Get.to(const TermsView());
                    },
                  ),




                  const SizedBox(height: 16,),
                  InkWell(
                    child: drawerItemWidget(
                        image: 'assets/images/lang.png',
                        txt: 'lang'.tr
                    ),
                    onTap:(){
                      Get.to(const TranlsateView());
                    },
                  ),
                  const SizedBox(height: 16,),
                  InkWell(
                    child: drawerItemWidget(
                        image: 'assets/images/profile.jpeg',
                        txt: 'profile'.tr
                    ),
                    onTap:(){
                      Get.to(ProfileView(
                        check: true,
                      ));
                    },
                  ),
                  const SizedBox(height: 16,),
                  InkWell(
                    child: drawerItemWidget(
                        image: 'assets/images/logout.jpeg',
                        txt: 'logout'.tr
                    ),
                    onTap:(){
                      final box=GetStorage();
                      box.remove('email');
                      Get.offAll(const SplashView());
                    },
                  ),
                  // const SizedBox(height: 16,),
                  // (email != 'x')
                  //     ? InkWell(
                  //   child: const Row(
                  //     children: [
                  //       SizedBox(
                  //         width: 30,
                  //       ),
                  //       Icon(
                  //         Icons.logout,
                  //         color: Colors.black,
                  //         size: 30,
                  //       ),
                  //       SizedBox(
                  //         width: 30,
                  //       ),
                  //       Custom_Text(
                  //         text: 'تسجيل خروج',
                  //         fontSize: 21,
                  //       )
                  //     ],
                  //   ),
                  //   onTap: () {
                  //     final box = GetStorage();
                  //     box.remove('email');
                  //     box.remove('name');
                  //     // Get.offAll(const LoginView());
                  //   },
                  // )
                  //     : InkWell(
                  //   child: const Row(
                  //     children: [
                  //       SizedBox(
                  //         width: 30,
                  //       ),
                  //       Icon(
                  //         Icons.login,
                  //         color: Colors.black,
                  //         size: 30,
                  //       ),
                  //       SizedBox(
                  //         width: 30,
                  //       ),
                  //       Custom_Text(
                  //         text: 'تسجيل دخول ',
                  //         fontSize: 21,
                  //       )
                  //     ],
                  //   ),
                  //   onTap: () {
                  //     // Get.to(const LoginView());
                  //   },
                  // ),


        ]))));
  }


  Widget drawerItemWidget({required String image,required String txt}){
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 6,top:20),
      child: Row(
        children: [
          const SizedBox(width: 14,),
          SizedBox(
            height: 60,
            width: 52,
              child: Image.asset(image,fit:BoxFit.contain,)),
          const SizedBox(width: 12,),
          Custom_Text(text: txt,
          alignment:Alignment.center,
            fontSize:18,
            color:ColorsManager.textColorDark,
          )
        ],
      ),
    );
  }
}
