import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Features/services/all_services.dart';

import '../../../profile/views/profile_view.dart';
import 'home_view.dart';


class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> fragmentScreens = [
      const HomeView(),
      const AllServicesView(),
       ProfileView(check: false,)


    ];

    List _navigationButtonProperties = [
      {"active_icon": (Icons.home), "non_active_icon":
      (Icons.home_outlined), "label": "home".tr},
      {"active_icon": (Icons.app_settings_alt), "non_active_icon": (Icons.app_settings_alt_outlined),
        "label": "services".tr},
      {"active_icon": (Icons.account_box_sharp),
        "non_active_icon": (Icons.account_box_outlined), "label": "profile".tr},

    ];

    RxInt indexNumber = 0.obs;
    return Scaffold(
      //backgroundColor: ColorsManager.white,
        appBar: AppBar(
          toolbarHeight: 1,
          backgroundColor: ColorsManager.primary,
        ),
        body: SafeArea(child: Obx(() => fragmentScreens[indexNumber.value])),
        bottomNavigationBar: Obx(() => Container(
          //  color:Colors.grey[200],
          padding: const EdgeInsets.all(10.0),
          child: BottomNavigationBar(
            currentIndex: indexNumber.value,
            onTap: (value) {
              indexNumber.value = value;
            },
            showSelectedLabels: true,
            backgroundColor: ColorsManager.textColorLight,
            showUnselectedLabels: true,
            selectedItemColor: ColorsManager.primary,
            unselectedItemColor: Colors.grey,
            items: List.generate(3, (index) {
              var BtnProp = _navigationButtonProperties[index];
              return BottomNavigationBarItem(
                  backgroundColor: ColorsManager.textColorLight,
                  icon: Icon(BtnProp["non_active_icon"]),
                  activeIcon: Icon(BtnProp["active_icon"]),
                  label: BtnProp["label"]);
            }),
          ),
        )));
  }
}
