import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/resources/strings_manager.dart';
import 'package:shop_app/Core/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:shop_app/Core/widgets/drawer.dart';
import 'package:shop_app/Features/search/search_view2.dart';
import '../../../academy/presentation/academy_details_view.dart';
import '../../../academy/presentation/all_academy_view.dart';
import '../../../search/search_view.dart';
import '../../../services/all_services.dart';
import '../manager/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
final controller = Get.put(HomeController());


class _HomeViewState extends State<HomeView> {
  final controller = Get.put(HomeController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    controller.fetchSliderImages();
    controller.sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 22.0,right: 22),
              child: InkWell(child: const
              Icon(Icons.filter_alt_outlined,color:Colors.white,),
              onTap:(){
                controller. openShowDialog(context);
              },
              ),
            )
          ],
          leading:IconButton(
            icon:const Icon(Icons.drag_handle),
            color:Colors.white,
            onPressed:(){
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          toolbarHeight: 60,
          elevation: 0.5,
          backgroundColor: ColorsManager.primary,
          title:  Custom_Text(
            color: ColorsManager.textColorLight,
            fontWeight: FontWeight.w500,
            text: 'appName'.tr,
            alignment: Alignment.center,
            fontSize: 27,
          ),
          iconTheme:
          IconThemeData(color: ColorsManager.iconColor, size: 30),
        ),

      drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 14,),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                       // border: Border.all(color: ColorsManager.textColorDark)
                    ),
                    child: TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                          hintText: "enterAcademyName".tr,
                          border: InputBorder.none,
                          icon:  Padding(
                            padding: const EdgeInsets.only(
                               right:11, left: 12, top: 10, bottom: 10),
                            child: InkWell(
                              child:  Icon(
                                Icons.search,
                                size: 21,
                                color: ColorsManager.iconColor,
                              ),
                              onTap:(){
                                Get.to(SearchView2(
                                  name:controller.searchController.text ,
                                ));
                              },
                            ),
                          )),
                      // onTap: () => Get.to(const SearchView()),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ImageSliderWidget(),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 22,right: 22),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Custom_Text(
                      text: 'academies'.tr,
                      color: ColorsManager.textColorDark,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.17,
                    // ),
                    InkWell(
                      child: Row(

                        children: [
                          Custom_Text(
                            text: 'allAcademy'.tr,
                            color: ColorsManager.textColorDark,
                            fontSize: 18,
                            alignment: Alignment.center,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(width: 3),
                           Icon(Icons.arrow_circle_right_outlined,
                              size: 24, color: ColorsManager.textColorDark)
                        ],
                      ),
                      onTap: () {
                        Get.to(const AllAcademyView());
                      //  Get.to(const AllProductsView());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: productWidget(),
              ),
            ],
          ),
        ));
  }
}



Widget productWidget() {
  final HomeController controller = Get.find();

  return SizedBox(
    height: 400,
    child: StreamBuilder(
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
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot posts = snapshot.data!.docs[index];
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    }
                    return ProductWidget(
                        posts: posts, index: index, controller: controller);
                  });
          }
        }),
  );
}

Widget ImageSliderWidget(){
  return  SizedBox(
    height: 240,
    child: ListView(
      physics:const NeverScrollableScrollPhysics(),
      children: <Widget>[
        GetBuilder<HomeController>(builder: (context) {
          return Column(
            children: [
              SizedBox(
                height: 220,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  controller: controller.sliderController,
                  slideBuilder: (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: controller.colors[index],
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                controller.sliderImagesList[index],
                              ),
                            )),
                      ),
                    );
                  },
                  slideTransform: const DefaultTransform(),
                  slideIndicator: CircularSlideIndicator(
                    padding: const EdgeInsets.only(bottom: 32),
                    currentIndicatorColor: ColorsManager.primary,
                    indicatorBackgroundColor: ColorsManager.textColorLight,
                  ),
                  itemCount: controller.sliderImagesList.length,
                  initialPage: 0,
                  enableAutoSlider: true,
                ),
              ),
            ],
          );
        }),
      ],
    ),
  );
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
        width: 240,
        height: 220,
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


