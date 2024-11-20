import 'package:flutter/material.dart';
import 'package:smiley_foods/AuthScreen/forget_page.dart';
import 'package:smiley_foods/AuthScreen/signup_page.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/home_page.dart';
import 'package:smiley_foods/HomeScreen/location_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var _throwShotAway = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text(
                "Log In",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please sign in to your existing account",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter the email",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.mail)),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          activeColor: PrimaryColorgreen,
                          value: _throwShotAway,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _throwShotAway = newValue!;
                            });
                          },
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ForgetPage()));
                          },
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LocationScreen()));
                            },
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Or",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {},
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Image.asset(
                      "assets/images/facebook.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(),
                    child: Image.asset("assets/images/twitter.png"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(),
                    child: Image.asset("assets/images/linkedin.png"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(),
                    child: Image.asset("assets/images/google.png"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
