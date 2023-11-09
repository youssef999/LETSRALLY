


 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    String lang=box.read('locale');
    if(lang=='en'){
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
              child: Text('aboutTxt'.tr,
                textDirection:TextDirection.ltr,
                 style: GoogleFonts.tajawal(
                  color:Colors.black,fontSize: 16,fontWeight: FontWeight.w500,
                  textBaseline: TextBaseline.alphabetic
              )

                // const TextStyle(
                //     fontSize: 16,
                //     fontWeight:FontWeight.w700
                // ),
              ),
            ),
          ],),
        ),
      );
    }else{

     String about=
     """منذ عام 2021، كنا في مهمة لتسهيل على الآباء العثور على الأنشطة والرياضة لأطفالهم. هدفنا هو توفير منصة سهلة الاستخدام تربط الآباء بالشركات والمؤسسات التي تقدم الأنشطة والبرامج التي سيحبها أطفالهم. وفي المرحلة الثانية من إطلاقنا، سنتعاون مع المدارس ودور الحضانة لتوفير طريقة أسهل للآباء للعثور على البرامج والأنشطة التي يحتاجها أطفا
تم إنشاء تطبيق LETS RALLY من قبل الآباء الذين كانوا يبحثون عن طريقة أسهل للعثور على الأنشطة والرياضة لأطفالهم. يتضمن التطبيق مجموعة واسعة من الأنشطة والرياضات، حتى يتمكن الآباء من العثور بسهولة على ما يبحثون عنه. بالإضافة إلى ذلك، سيكون التطبيق متاحًا للمدارس ودور الحضانة في المستقبل، حتى يتمكن أولياء الأمور من العثور بسهولة على أنشطة لأطفالهم.""";


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
              padding: const EdgeInsets.all(12.0),
              child: Text(about,
                textDirection:TextDirection.rtl,
                style:const TextStyle(
                  fontSize: 16,
                  fontWeight:FontWeight.w700
                ),
              ),
            ),

          ],),
        ),
      );
    }

  }
}
