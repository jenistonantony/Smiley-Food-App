import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBkQ8YeLYJhOrhEbE61pzQ6EKfq818P88k',
          appId: "1:870005085361:android:565cb21c71d79a7308fe90",
          messagingSenderId: '870005085361',
          projectId: 'miley-food-84b46',
          storageBucket: "smiley-food-84b46.firebasestorage.app"));
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
    return GetMaterialApp(
      theme: ThemeData(
        textTheme:
            GoogleFonts.ptSansCaptionTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesClass.approute,
      getPages: RoutesClass.route,
    );
    // return GetMaterialApp(
    //   theme: ThemeData(
    //       textTheme:
    //           GoogleFonts.ptSansCaptionTextTheme(Theme.of(context).textTheme)),
    //   debugShowCheckedModeBanner: false,
    //   home: const LoginScreen(),
    // );
  }
}
