import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/controller/register_controller.dart';

class RegisterPage extends StatefulWidget {
  String? number;
  RegisterPage({super.key, this.number});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please Register to get started",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Enter the name",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Enter the email",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: InkWell(
                              onTap: () {},
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    hintText: "Enter the phone",
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    registerController.registerUser(
                        name: nameController.toString(),
                        email: emailController.toString(),
                        phone: phoneController.toString());
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
