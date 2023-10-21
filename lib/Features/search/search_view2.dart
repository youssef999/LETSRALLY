


 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';

import '../../Core/resources/color_manager.dart';
import '../../Core/widgets/Custom_Text.dart';
import '../academy/presentation/academy_details_view.dart';

class SearchView2 extends StatelessWidget {

  String name;
  SearchView2({required this.name});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:CustomAppBar('', true, 55),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchWidget(),
      )
    );
  }

  Widget SearchWidget() {

    return SizedBox(
      height: 19000,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('academy')
              .where('name', isEqualTo: name)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading'));
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text('Loading...');
              default:

                if(snapshot.data!.docs.isEmpty){
                  return Center(
                    child: Text('noData'.tr,
                    style:const TextStyle(
                      color:Colors.black,
                      fontSize: 25,
                      fontWeight:FontWeight.w600

                    ),
                    ),
                  );
                }
                return   GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 4,
                        childAspectRatio:0.73
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot posts = snapshot.data!.docs[index];
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      }
                      if(snapshot.data!.docs.length<1){
                        return const Center(
                          child:Custom_Text(
                            text: 'nnn',
                            fontSize: 33,
                          ),
                        );
                      }else{
                        print("ELSE");
                        print(snapshot.data!.docs.length);
                        return InkWell(
                          child: Hero(
                            tag: 'img$index',
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border:Border.all(color:ColorsManager.primary),
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorsManager.textColorLight),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    // physics: const NeverScrollableScrollPhysics(),
                                    children: <Widget>[
                                      SizedBox(
                                        height: 150,
                                        //MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          posts['image'],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0,right:3,top:22),
                                        child: Wrap(
                                          children: [
                                            SizedBox(
                                              width:120,
                                              child: Custom_Text(
                                                text: posts['name'],
                                                fontSize: 24,
                                                textAlign:TextAlign.center,
                                                alignment:Alignment.center,
                                                color: ColorsManager.textColorDark,
                                                fontWeight:FontWeight.w800,
                                                //  alignment: Alignment.topLeft,
                                              ),
                                            ),
                                          ],

                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.to(AcademyDetailsView(posts: posts));

                          },
                        );
                      }

                    });


            }
          }),
    );
  }
}
