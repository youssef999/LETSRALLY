

 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/widgets/Custom_Text.dart';
import 'package:shop_app/Core/widgets/Custom_button.dart';
import 'package:shop_app/Core/widgets/custom_app_bar.dart';
import 'package:shop_app/Features/Home/presentation/views/home_view.dart';
import 'package:shop_app/Features/Home/presentation/views/main_home.dart';

class RegisterCodesView extends StatelessWidget {
  const RegisterCodesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('', true, 54),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.only(left:18.0,right: 18,bottom: 21),
        child: CustomButton(
          text: 'returnHome'.tr,
          onPressed:(){
            Get.offAll(const MainHome());
          },
          color2:ColorsManager.buttonColor2,
          color1: ColorsManager.buttonColor,
        ),
      ),
      body: RegisterCodeWidget()
    );
  }

  Widget RegisterCodeWidget() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('academy_register')
            .where('email',isEqualTo: 'test@gmail.com').
            orderBy('date',descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                 // scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot posts = snapshot.data!.docs[index];
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    }
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child:Column(
                          children: [
                            const SizedBox(height: 11,),
                            QrImageView(
                              data: posts['code'],
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                            const SizedBox(height: 11,),
                            Custom_Text(text: posts['academy'],
                              color:ColorsManager.primary,
                              fontSize: 21,
                            ),
                            const SizedBox(height: 11,),
                            Custom_Text(text: posts['code'],
                            color:ColorsManager.textColorDark,
                              fontSize: 21,
                            ),
                            const SizedBox(height: 10,)
                          ],
                        ),
                      ),
                    );
                  });
          }
        });
  }
}
