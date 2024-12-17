import 'package:flutter/material.dart';
import 'package:smiley_foods/AuthScreen/login_page.dart';

import 'package:smiley_foods/AuthScreen/verification_page.dart';
import 'package:smiley_foods/Components/color.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                )),
          ],
        ),
      ),
      const Center(
        child: Text(
          "Forget Password",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "Please sign in to your existing account",
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        height: 150,
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
                "Email",
                style: TextStyle(
                    color: green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    // showCursor: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter the Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.mail),
                    ),
                  )),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(15)),
          child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerificationPage()));
              },
              child: const Text(
                "SEND CODE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))),
    ]));
  }
}
