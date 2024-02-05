import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poloniex_app/Views/home.dart';
import 'package:poloniex_app/Views/onboard.dart';

import 'controllers/auth_controllers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'PolonixApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
      // home: const  OnboardScreen(),
      home:  HomeScreen(),
    );
  }
}

