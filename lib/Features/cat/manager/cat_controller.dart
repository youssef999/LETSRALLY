import 'package:get/get.dart';

class CatController extends GetxController{


  String selectedRadioValue = 'male';

  void setSelectedRadioValue(String value) {
      selectedRadioValue = value;
    update();

  }



}