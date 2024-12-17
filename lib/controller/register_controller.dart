import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smiley_foods/HomeScreen/home_page.dart';
import 'package:smiley_foods/baseurl.dart';
import 'package:smiley_foods/const.dart';

import '../model/register_model.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var isRegistered = false.obs;
  var isRegisterLoading = false.obs;
  RegisterModel? registerModel;
  registeruser({
    String? name,
    String? email,
    String? phone,
  }) async {
    try {
      isLoading(true); // Show loading state

      final response = await http.post(
          Uri.parse(ApiDomain.register), // Ensure this is the correct endpoint
          headers: <String, String>{
            "Accept": "*/*"
          },
          body: {
            "name": name.toString(),
            "email": email.toString(),
            "mobileNo": phone.toString(),
            "role": "consumer",
            "registeredType": "app"
          });
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data["status"] == false) {
          Get.snackbar(
            backgroundColor: Colors.white,
            "Error Login",
            data["message"].toString(),
          );
        } else {
          registerModel = RegisterModel.fromJson(data);
          print(registerModel!.data!.token);
          username = registerModel!.data!.data!.userName.toString();
          userphone = registerModel!.data!.data!.mobileNo.toString();
          userId = registerModel!.data!.data!.userId.toString();
          token = registerModel!.data!.token.toString();
          email = registerModel!.data!.data!.email.toString();
          print(userId);
          print(userToken);
          print(username);
          print(userphone);

          Timer(const Duration(seconds: 0), () {
            getStorage.write("usernumber", userphone);
            getStorage.write("username", username);
            getStorage.write("email", email);
            getStorage.write("userId", userId);
            getStorage.write("token", token);
          });

          //Get.to(LoginScreen);

          Get.to(const HomePage());
        }
      } else {
        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          backgroundColor: Colors.white,
          'Mobile number already exist',
          'Try with another number',
          // response.statusCode.toString(),
        );
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar(
        "Error",
        "An unexpected error occurred: $e",
        backgroundColor: Colors.white,
      );
      print("Exception: $e");
    } finally {
      isRegisterLoading(false);
    }
  }
}
