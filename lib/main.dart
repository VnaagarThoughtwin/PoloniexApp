import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poloniex_app/Views/home.dart';
import 'package:poloniex_app/Views/onboard.dart';

void main() {
  runApp(const MyApp());
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
      // home: const  OnboardScreen(),
      home:  HomeScreen(),
    );
  }
}

