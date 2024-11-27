import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smiley_foods/AuthScreen/login_page.dart';
import 'package:smiley_foods/AuthScreen/verification_page.dart';
import 'package:smiley_foods/HomeScreen/cart.dart';
import 'package:smiley_foods/HomeScreen/home_page.dart';

import 'package:smiley_foods/SplashScreen/splash_screen.dart';
import 'package:smiley_foods/controller/login_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //       textTheme:
    //           GoogleFonts.ptSansCaptionTextTheme(Theme.of(context).textTheme)),
    //   debugShowCheckedModeBanner: false,
    //   home: const SplashScreen(),
    // );
    return GetMaterialApp(
      theme: ThemeData(
          textTheme:
              GoogleFonts.ptSansCaptionTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}
