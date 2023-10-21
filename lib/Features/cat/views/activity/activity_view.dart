


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Features/cat/views/Place/place_academy_view.dart';

import 'act_academy-view.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:CustomAppBar('', true, 55),
        body:ActWidget()
    );
  }


  Widget ActWidget() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Activity')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio:0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20), //  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot posts = snapshot.data!.docs[index];
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    }
                    return InkWell(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration:BoxDecoration(
                                color:Colors.grey[100],
                                border:Border.all(color:Colors.grey),
                                borderRadius:BorderRadius.circular(15)
                            ),
                            child:Column(
                              children: [

                               SizedBox(
                                 height:160,
                                 child:Image.asset('assets/images/act.jpeg',
                                 fit:BoxFit.fill,
                                 ),
                               ),
                                const SizedBox(height: 16,),
                                Custom_Text(text: posts['name'],
                                  alignment:Alignment.center,
                                  fontSize: 23,
                                  fontWeight:FontWeight.w700,
                                  color:ColorsManager.textColorDark,
                                )
                              ],
                            ),
                          )
                      ),
                      onTap:(){

                        Get.to(ActAcademyView(
                          cat: posts['name'],
                        ));
                      },
                    );
                  });
          }
        });
  }
}
