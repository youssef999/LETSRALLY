

 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Features/services/service_cat.dart';

class AllServicesView extends StatelessWidget {
  const AllServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200],
      appBar: CustomAppBar('', false, 5),
      body:Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            const SizedBox(height: 21,),
            InkWell(
              child: ServiceCardWidget(
                image: 'assets/images/aca.jpeg',
                txt: 'aca'.tr
              ),
              onTap:(){
                Get.to(ServiceCatView(
                  cat: 'academy',
                ));
              },
            ),
            const SizedBox(height: 21,),
            InkWell(
              child: ServiceCardWidget(
                  image: 'assets/images/sc.jpeg',
                  txt: 'school'.tr
              ),
              onTap:(){
                Get.to(ServiceCatView(cat: 'school'));
              },
            ),
            const SizedBox(height: 21,),
            InkWell(
              child: ServiceCardWidget(
                  image: 'assets/images/nur.webp',
                  txt: 'nurse'.tr
              ),
              onTap:(){
                Get.to(ServiceCatView(cat: ''));
              },
            ),

          ],
        ),
      ),
    );
  }
}
Widget ServiceCardWidget({required String image,required String txt}){
  return Container(
    height: 300,
    decoration: BoxDecoration(
      color:ColorsManager.colorHelper,
    borderRadius: BorderRadius.all(Radius.circular(14))
    ),
    child:Column(
      children: [

        SizedBox(
          height: 210,
          width: 400,
          child: Image.asset(image,
          fit:BoxFit.fill,
          ),
        ),
        const SizedBox(height: 16,),
        Custom_Text(text: txt,fontSize: 28,
        alignment:Alignment.center,
          fontWeight:FontWeight.bold,
          color:ColorsManager.textColorDark,
        )
      ],
    ),
  );
}
