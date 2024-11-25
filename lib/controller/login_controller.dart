import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smiley_foods/AuthScreen/verification_page.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/baseurl.dart';
import 'package:smiley_foods/const.dart';

class LoginController extends GetxController {
  var isDataLoading = false.obs;
  Future login({
    dynamic mobileNo,
  }) async {
    try {
      isDataLoading(true);
      var response =
          await http.post(Uri.parse(ApiDomain.otp), headers: <String, String>{
        "userid": "67440a5cca713d4dc530a31c",
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzQ0MGE1Y2NhNzEzZDRkYzUzMGEzMWMiLCJtb2JpbGVObyI6Ijk3NjkxNzEyOTkiLCJpYXQiOjE3MzI1MTczNjgsImV4cCI6MTczMjYwMzc2OH0.-02nvgAScuxjbFetpYBzxJLVL63MntmvJIk-J213-CU"
      }, body: {
        "mobileNo": mobileNo
      });
      print(response.statusCode.toString());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.statusCode);
        print(response.body);

        // String signinotpvalue = data["data"]["otp"].toString();
        getStorage.write("signinotpvalue", data["data"].toString());
        signinotpvalue = getStorage.read("signinotpvalue");
        print("mugesh${getStorage.read("signinotpvalue")}");
        print(data["data"].toString());
        print('hhhhh');
        print(mobileNo);
        //Get.to(MyLoadingScreen());

        Get.to(VerificationPage(
          phone: mobileNo,
          otp: signinotpvalue,
        ));
      } else {
        Get.snackbar(
            backgroundColor: const Color.fromARGB(255, 248, 3, 3),
            "Invalid",
            'Please enter the number',
            colorText: Colors.white);
        print(response.body);
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        backgroundColor: primaryColor,
        "Mobile number already exist",
        'Try with another number',
      );
      print(e.toString());
      // ignore: dead_code_catch_following_ca tch
    } catch (e) {
      print("$e");
    } finally {
      isDataLoading(false);
    }
  }
}
