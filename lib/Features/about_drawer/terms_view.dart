


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';

class TermsView extends StatelessWidget {
  const TermsView ({super.key});

  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    String lang=box.read('locale');
    if(lang=='en'){
      return  Scaffold(
        backgroundColor:Colors.white,
        appBar: CustomAppBar('', true, 55),
        body:ListView(

          children: [
          const SizedBox(height: 22,),
          SizedBox(
            height: 140,
            child:Image.asset('assets/images/logo.jpg'),
          ),
          const SizedBox(height: 20,),
          const Divider(
            color:Colors.black,
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('termsTxt'.tr,
            textDirection:TextDirection.ltr,
              style:const TextStyle(
                  fontSize: 16,
                  fontWeight:FontWeight.w700
              ),
            ),
          ),
          // Custom_Text(text:
          // 'termsTxt'.tr,
          //   fontSize: 18,
          //   color:Colors.black,
          //   alignment: Alignment.topLeft,
          // )
        ],),
      );
    }else{
      return  Scaffold(
        backgroundColor:Colors.white,
        appBar: CustomAppBar('', true, 55),
        body:Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView(children: [
            const SizedBox(height: 22,),
            SizedBox(
              height: 140,
              child:Image.asset('assets/images/logo.jpg'),
            ),
            const SizedBox(height: 20,),
            const Divider(
              color:Colors.black,
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('termsTxt'.tr,
                textDirection:TextDirection.ltr,
                style:const TextStyle(
                    fontSize: 16,
                    fontWeight:FontWeight.w700
                ),
              ),
            ),
            // Custom_Text(text:
            // 'termsTxt'.tr,
            //   fontSize: 18,
            //   color:Colors.black,
            //   alignment: Alignment.topRight,
            // )
          ],),
        ),
      );
    }

  }
}
