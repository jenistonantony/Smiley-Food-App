import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:smiley_foods/AuthScreen/register_page.dart';

import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/const.dart';
import 'package:smiley_foods/controller/login_controller.dart';

class VerificationPage extends StatefulWidget {
  String? otp;
  String? mobilenumber;
  VerificationPage({
    super.key,
    // this.otp,
    // this.phone,
    this.otp,
    this.mobilenumber,
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController codeController = TextEditingController();
  bool isResendAllowed = false;
  int remainingSeconds = 30;
  Timer? timer;
  FirebaseAuth auth = FirebaseAuth.instance;
  LoginController login = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    codeController.dispose();
    super.dispose();
  }

  void startResendTimer() {
    setState(() {
      remainingSeconds = 30;
      isResendAllowed = false;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          isResendAllowed = true;
        });
      }
    });
  }

  void sendCode() {
    print("Resending code to user's email...");
    startResendTimer();
  }

  void verifyCode() {
    String enteredCode = codeController.text.trim();
    print("Verifying code: $enteredCode");
  }

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent)),
    );
    return Scaffold(
        body: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.values.first,
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ],
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                print(signinotpvalue);
              },
              child: const Text(
                "Otp Verification",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "We have sent a code to your phone number",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 20),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter Code",
                    style: TextStyle(
                        color: green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Pinput(
                      controller: codeController,
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: Colors.green),
                        ),
                      ),
                      onCompleted: (pin) => debugPrint(pin),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // const Text(
                      //   "Didn't receive the code?",
                      //   style: TextStyle(fontSize: 14),
                      // ),
                      const Spacer(),
                      GestureDetector(
                        onTap: isResendAllowed ? sendCode : null,
                        child: Text(
                          isResendAllowed
                              ? "Resend"
                              : "Resend in $remainingSeconds sec",
                          style: TextStyle(
                            color: isResendAllowed
                                ? primaryColor
                                : Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () async {
              // if (codeController.text.isEmpty) {
              //   Get.snackbar("error", "loging",
              //       backgroundColor: Colors.amber,
              //       duration: const Duration(seconds: 5));
              // } else {
              //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
              //       verificationId: widget.verificationIds.toString(),
              //       smsCode: codeController.text);

              //   // Sign the user in (or link) with the credential
              //   await auth.signInWithCredential(credential);
              //   // Navigator.push(
              //   //     context, MaterialPageRoute(builder: (context) => Home()));
              // }
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => (RegisterPage())));

              if (codeController.text.toString() == signinotpvalue) {
                login.userValidate(phone: widget.mobilenumber);
                setState(() {
                  showLoading = true;
                });
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    showLoading = false;
                  });
                });

                print(widget.otp);
                print(widget.mobilenumber);

                // setState(() {
                //   _errorMessage = 'Please enter OTP';
                // });
              } else if (widget.mobilenumber == null) {
                Get.snackbar('Invalid', 'Wrong OTP', colorText: Colors.white);
                print("Wrong otp.$codeController");
                print(widget.otp);
                Get.to(RegisterPage(
                  number: widget.mobilenumber,
                ));
              } else if (codeController.text.isEmpty ||
                  signinotpvalue != codeController.text) {
                Get.snackbar('Invalid', 'Please Enter The Correct OTP',
                    colorText: Colors.white, backgroundColor: primaryColor);
              }
            },
            child: const Text(
              "VERIFY CODE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }
}
