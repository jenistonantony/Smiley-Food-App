import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:confetti/confetti.dart';

class CongratulationAnimationPage extends StatefulWidget {
  const CongratulationAnimationPage({super.key});

  @override
  State<CongratulationAnimationPage> createState() =>
      _CongratulationAnimationPageState();
}

class _CongratulationAnimationPageState
    extends State<CongratulationAnimationPage> {
  final _controller = ConfettiController();
  bool isPlaying = false;
  void display() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/congratulation.png"),
              AnimatedButton(
                height: 50,
                width: 160,
                text: 'Congratulation',
                isReverse: true,
                selectedTextColor: primaryColor,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                backgroundColor: primaryColor,
                borderColor: primaryColor,
                borderRadius: 20,
                borderWidth: 2,
                onPress: () {
                  if (isPlaying) {
                    _controller.stop();
                  } else {
                    _controller.play();
                  }
                  isPlaying = !isPlaying;
                  Colors.deepPurple.shade300;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    Get.toNamed('/TrackOrderScreen');
                  },
                  child: const Text(
                    "TRACK ORDER",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ))
            ],
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          colors: const [Colors.deepOrange, Colors.deepPurple],
          gravity: 0.01,
          emissionFrequency: 0.1,
        ),
      ],
    );
  }
}
