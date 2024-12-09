import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:smiley_foods/AuthScreen/login_page.dart';
import 'package:smiley_foods/HomeScreen/home_page.dart';
import 'package:smiley_foods/baseurl.dart';
import 'package:smiley_foods/const.dart';

import 'package:smiley_foods/model/token_model.dart';

// URL of the Register API

class TokenController extends GetxController {
  TokemModel? hub;
// Function to make a POST request
  Future tokenapi({
    String? userName,
    String? email,
    String? userId,
    String? mobileNo,
    String? role,
  }) async {
    try {
      // Prepare the request body
      final Map<String, dynamic> requestBody = {
        "userName": userName,
        "email": email,
        "userId": userId,
        "mobileNo": mobileNo,
        "uuid": ""
      };

      // Send the POST request
      var response = await http.post(
        Uri.parse(ApiDomain.token),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      // Check the response status
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body.toString());
        hub = TokemModel.fromJson(result);
        Get.to(const HomePage());
        String id = hub!.data!.data!.userId.toString();
        String token = hub!.data!.token.toString();
        print('user info');
        // print(id);
        // print(token);
        userId = id;
        userToken = token;
        print('user token $userToken');
        await getStorage.write('mobileNo', mobileNo.toString());

        getStorage.write('user_id', id.toString());
        getStorage.write('user_token', token.toString()).whenComplete(() => {
              // Get.offAll(const HomeScreen()),
            });
        userId = getStorage.read("user_id");
        userToken = getStorage.read("user_token");
        // Parse the JSON response into a Register object
      } else {
        // Get.to(  LoginScreen());
        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  var isRegisterLoading = false.obs;

// api register
  void register({
    String? name,
    referalCode,
    uuid,
    email,
    otp,
    mobileNo,
  }) async {
    try {
      print("hello");
      isRegisterLoading(true);
      var response = await post(Uri.parse(ApiDomain.register),
          headers: <String, String>{
            "Accept": "/",
            "Content-Type": "application/json; charset=utf-8"
          },
          body: jsonEncode(<String, dynamic>{
            "name": name.toString(),
            "email": email.toString(),
            "mobileNo": mobileNo.toString(),
            "role": "consumer",
            "uuid": uuid.toString(),
            "parentReferalCode": referalCode.toString()
          }));

      print(response.statusCode.toString());
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        print("account created successfully");
        Get.snackbar(
          'Registered',
          'Successfully',
          backgroundColor: Color.fromARGB(255, 168, 255, 170),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
        tokenapi(mobileNo: mobileNo);
        Timer(Duration(seconds: 2), () {
          //Get.offAll(() => HomeScreen());
        });
      } else {
        Get.snackbar(
          'Registered Failed',
          'E-Mail Already Exits!',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );

        print("response${response.body}");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Timer(Duration(seconds: 2), () {
        isRegisterLoading(false);
      });
    }
  }
}
