import 'package:flutter/material.dart';
import 'package:smiley_foods/AuthScreen/login_page.dart';
import 'package:smiley_foods/Components/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      const SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                )),
          ],
        ),
      ),
      const Center(
        child: Text(
          "Sign Up",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "Please sign up to get started",
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        height: 445,
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
                "Name",
                style: TextStyle(
                    color: PrimaryColorgreen,
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
                    keyboardType: TextInputType.name,
                    controller: controller,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.person)),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Email",
                style: TextStyle(
                    color: PrimaryColorgreen,
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Password",
                style: TextStyle(
                    color: PrimaryColorgreen,
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
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the password",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ))),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Re-Type Password",
                style: TextStyle(
                    color: PrimaryColorgreen,
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
                    keyboardType: TextInputType.visiblePassword,
                    controller: repasswordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the password",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.grey,
                            ))),
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
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text(
                "SIGN UP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))),
    ])));
  }
}
