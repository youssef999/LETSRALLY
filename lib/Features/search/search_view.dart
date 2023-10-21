import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/Custom_button.dart';
import 'package:shop_app/Features/academy/presentation/academy_details_view.dart';




class SearchView extends StatefulWidget {


  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<SearchView> {

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TextEditingController controller=TextEditingController();
  String searchData='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor:ColorsManager.primary,
          leading: InkWell(child: const Icon(Icons.arrow_back_ios,size: 27,color:Colors.white),
            onTap:(){
              Get.back();
            },
          ),
        ),
        body: ListView(children:  [
          const SizedBox(
            height: 4,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 22.0,right: 22,top:22),
              child: Container(
                decoration:BoxDecoration(
                    border:Border.all(color:ColorsManager.textColorDark)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    decoration:  InputDecoration(
                        hintText: 'enterAcademyName'.tr,
                        border:InputBorder.none,
                        icon:
                        Icon(Icons.search,size:21,color:ColorsManager.iconColor,)
                    ),
                    onChanged:(value){
                      setState(() {
                        searchData=value;
                      });
                    },
                  ),
                ),
              )
          ),
          const SizedBox(
            height: 20,
          ),
          SearchWidget()

        ]));
  }


  Widget SearchWidget() {
    final box=GetStorage();
    return SizedBox(
      height: 19000,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('academy')
              .where('name', isGreaterThanOrEqualTo: searchData)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading'));
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text('Loading...');
              default:
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
                    });


            }
          }),
    );
  }

}