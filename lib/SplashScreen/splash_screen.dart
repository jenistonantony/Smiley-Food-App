import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smiley_foods/OnboardingScreen/onboarding_view.dart';
import 'package:smiley_foods/const.dart';
import 'package:smiley_foods/controller/token_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TokenController tokencontroller = Get.put(TokenController());
  @override
  void initState() {
    super.initState();

    userId = getStorage.read("userId") ?? "";
    userToken = getStorage.read("token") ?? "";
    userphone = getStorage.read("usernumber") ?? "";

    print(userId);
    print(userToken);
    print(userphone);

    Future.delayed(Duration.zero, () {
      if (userphone.isNotEmpty) {
        tokencontroller.tokenapi(mobileNo: userphone);
      } else {
        Get.offAll(const OnboardingScreen());
      }
    });
  }

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
