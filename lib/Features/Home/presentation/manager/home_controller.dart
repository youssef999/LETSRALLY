
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Core/resources/color_manager.dart';

import '../../../cat/views/activity/activity_view.dart';
import '../../../cat/views/gender/gender_view.dart';
import '../../../cat/views/Place/location_view.dart';

class HomeController extends GetxController{


  final List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List  sliderImagesList= [];


  bool isPlaying = true;
  TextEditingController searchController=TextEditingController();

  late CarouselSliderController sliderController;

  Future<void> fetchSliderImages() async {
    QuerySnapshot snapshot =
    await firestore.collection('carsoul').get();
    sliderImagesList =
        snapshot.docs.map((doc)
        => doc['img1']).toList();

    print("CAR length");
    print(sliderImagesList.length);
    update();
  }


  openShowDialog(BuildContext context){
    _showDialog(context);
  }
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {


        return AlertDialog(
          title:  Text('searchWith'.tr),
          // content: const Text('This is the content of the dialog.'),
          actions: <Widget>[

       //     const SizedBox(height: 11,),
            const Divider(
              thickness: 1.2,
              color:Colors.black,
            ),
            const SizedBox(height: 11,),
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 104,
                    decoration:BoxDecoration(
                      color:ColorsManager.primary,
                      borderRadius:BorderRadius.circular(7)
                    ),
                    child: TextButton(

                      child: Text('gender'.tr,

                        style:const TextStyle(color:Colors.white,
                            fontSize: 20

                        ),),
                      onPressed: () {
                        Get.to(const GenderView());
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
        Center(
        child: Container(
            width: 104,
        decoration:BoxDecoration(
        color:ColorsManager.primary,
        borderRadius:BorderRadius.circular(7)
        ),
                  child: TextButton(
                    child: Text('place'.tr,

                      style:const TextStyle(color:Colors.white,
                          fontSize: 20),),
                    onPressed: () {
                      Get.to(const LocationView());
                    },
                  )),
                ),
        const SizedBox(height: 20,),
        Center(
        child: Container(
          width: 104,
        decoration:BoxDecoration(
        color:ColorsManager.primary,
        borderRadius:BorderRadius.circular(7)
        ),
                  child: TextButton(
                    child:  Text('activity'.tr,style:const
                    TextStyle(color:Colors.white, fontSize: 20),),
                    onPressed: () {
                      Get.to(const ActivityView()); // Close the dialog
                    },
                  ),
                )),
              ],
            ),


          ],
        );
        // final box=GetStorage();
        // String lang=box.read('locale');
        // if(lang=='en'){
        //   return AlertDialog(
        //     title:  Text('searchWith'.tr),
        //     // content: const Text('This is the content of the dialog.'),
        //     actions: <Widget>[
        //
        //       const SizedBox(height: 11,),
        //       const Divider(
        //         thickness: 1.2,
        //         color:Colors.black,
        //       ),
        //       const SizedBox(height: 11,),
        //       Column(
        //         mainAxisAlignment:MainAxisAlignment.center,
        //         children: [
        //           TextButton(
        //
        //             child: Text('gender'.tr,
        //
        //               style:const TextStyle(color:Colors.black,
        //                 fontSize: 16
        //
        //               ),),
        //             onPressed: () {
        //               Get.to(const GenderView());
        //             },
        //           ),
        //           TextButton(
        //             child: Text('place'.tr,
        //
        //               style:const TextStyle(color:Colors.black,
        //                   fontSize: 16),),
        //             onPressed: () {
        //               Get.to(const LocationView());
        //             },
        //           ),
        //           TextButton(
        //             child:  Text('activity'.tr,style:const TextStyle(color:Colors.black, fontSize: 16),),
        //             onPressed: () {
        //               Get.to(const ActivityView()); // Close the dialog
        //             },
        //           ),
        //         ],
        //       ),
        //
        //
        //     ],
        //   );
        // }else{
        //   return AlertDialog(
        //     title:  Text('searchWith'.tr),
        //     // content: const Text('This is the content of the dialog.'),
        //     actions: <Widget>[
        //
        //       const Padding(
        //         padding: EdgeInsets.only(left:18.0,right: 18),
        //         child: Divider(
        //           thickness: 1.2,
        //           color:Colors.black,
        //         ),
        //       ),
        //       const SizedBox(height: 4,),
        //       Padding(
        //         padding: const EdgeInsets.only(left: 218.0),
        //         child: Column(
        //           children: [
        //             TextButton(
        //               child: Text('gender'.tr,
        //
        //                 style:const TextStyle(color:Colors.black,
        //                     fontSize: 17
        //
        //                 ),),
        //               onPressed: () {
        //                 Get.to(const GenderView());
        //               },
        //             ),
        //             TextButton(
        //               child: Text('place'.tr,style:const TextStyle(color:Colors.black, fontSize: 17),),
        //               onPressed: () {
        //                 Get.to(const LocationView());
        //               },
        //             ),
        //             TextButton(
        //               child:  Text('activity'.tr,style:const TextStyle(color:Colors.black, fontSize: 17),),
        //               onPressed: () {
        //                 Get.to(const ActivityView()); // Close the dialog
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //
        //
        //     ],
        //   );
        // }

      },
    );
  }

}