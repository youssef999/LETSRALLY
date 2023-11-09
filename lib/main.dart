
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app/Core/loalization/locale_controller.dart';
import 'package:shop_app/Core/resources/color_manager.dart';
import 'package:shop_app/Core/resources/strings_manager.dart';
import 'Core/loalization/locale.dart';
import 'Features/splash/splash_view.dart';



 void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());

 }


 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.put(LocaleController());

    final box=GetStorage();
    //en //ar
    String keylocal=box.read('locale')??'x';///en //ar //' '

    Locale lang = const Locale('en');

    if(keylocal!='x'){
      lang=Locale(keylocal);
      // box.write('locale', 'en');
    }

    else{

      box.write('locale','en');
      // lang=const Locale('ar');
    }

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
     // textDirection:TextDirection.rtl,
      title: StringManger.AppName,
      color:ColorsManager.primary,
        locale:lang,
        translations: MyLocal(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(color:ColorsManager.primary)
      ),
      home: //const MainHome()
      //const LoginView()
      const SplashView()
    );
  }
}
//com.job777.school


