import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smiley_foods/OnboardingScreen/onboarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lotties/Animation - 1728642377222.json",
            onLoaded: (composition) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnboardingScreen()));
          });
        }),
      ),
    );
  }
}
