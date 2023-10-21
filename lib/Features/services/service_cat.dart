

 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';

import '../Home/presentation/manager/home_controller.dart';
import '../academy/presentation/academy_details_view.dart';

class ServiceCatView extends StatelessWidget {
  
  String cat;
 ServiceCatView({super.key,required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200],
      appBar:CustomAppBar('', true, 44),
      body:
      (cat=='academy')?
      AcademyWidget():  Center(
        child: Custom_Text(text: 'soon'.tr,
          fontSize: 33,
        ),
      )
    );
  }
  Widget AcademyWidget() {

    final controller=Get.put(HomeController());
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('academy').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                //  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot posts = snapshot.data!.docs[index];
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductWidget(
                          posts: posts, index: index, controller: controller),
                    );
                  });
          }
        });
  }

}

 class ProductWidget extends StatelessWidget {
   final DocumentSnapshot posts;
   final int index;
   final HomeController controller;
   const ProductWidget(
       {super.key,
         required this.posts,
         required this.index,
         required this.controller});

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(left:4.0,right: 4),
       child: SizedBox(
         child: Column(
           children: [
             InkWell(
               child: Hero(
                 tag: 'img$index',
                 child: Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Container(
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey[100]!),
                         borderRadius: BorderRadius.circular(21),
                         color: Colors.grey[100]),
                     child: Padding(
                       padding: const EdgeInsets.all(1.0),
                       child: Column(
                         children: <Widget>[
                           Container(
                             decoration: BoxDecoration(
                                 image: DecorationImage(
                                     image: NetworkImage(posts['image']),
                                     fit: BoxFit.fill),
                                 border: Border.all(color: Colors.grey[100]!),
                                 borderRadius: const BorderRadius.only(
                                   topLeft: Radius.circular(14),
                                   topRight: Radius.circular(14),
                                 ),
                                 color: Colors.grey[100]),
                             height: MediaQuery.of(context).size.height * 0.22,
                             width: MediaQuery.of(context).size.width,
                           ),
                           const SizedBox(height: 14),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               //name
                               Padding(
                                 padding: const EdgeInsets.all(3.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           left: 8.0, right: 3),
                                       child: Column(
                                         crossAxisAlignment:
                                         CrossAxisAlignment.start,
                                         children: [
                                           Custom_Text(
                                             text: posts['name'],
                                             fontSize: 17,
                                             alignment:Alignment.center,
                                             color: ColorsManager.textColorDark,
                                             fontWeight: FontWeight.w800,
                                           ),
                                           const SizedBox(
                                             height: 8,
                                           )
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               const SizedBox(
                                 height: 7,
                               ),

                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
               onTap: () {
                 Get.to(AcademyDetailsView(
                   posts: posts,
                 ));
                 //  Get.to(ProductDetailsView(posts: posts, tag: 'img$index'));
               },
             ),
           ],
         ),
       ),
     );
   }
 }