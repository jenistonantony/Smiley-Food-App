import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:smiley_foods/AuthScreen/register_page.dart';
import 'package:smiley_foods/AuthScreen/verification_page.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/home_page.dart';
import 'package:smiley_foods/baseurl.dart';
import 'package:smiley_foods/const.dart';
import 'package:smiley_foods/model/login_model.dart';

class LoginController extends GetxController {
  var isDataLoading = false.obs;
  LoginModel? loginModel;
  Future login({dynamic mobileNo}) async {
    try {
      isDataLoading(true);
      var response =
          await http.post(Uri.parse(ApiDomain.otp), headers: <String, String>{
        "userid": userId,
        "Authorization": userToken
      }, body: {
        "mobileNo": mobileNo,
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

        Get.to(VerificationPage(
          otp: signinotpvalue,
          mobilenumber: mobileNo,
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

  var isLoginLoading = false.obs;
  void userValidate({
    String? phone,
  }) async {
    try {
      isLoginLoading(true);
      var response =
          await post(Uri.parse(ApiDomain.login), headers: <String, String>{
        "Accept": "/",
      }, body: {
        "mobileNo": phone
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        loginModel = LoginModel.fromJson(data);
        username = loginModel!.data!.data!.userName.toString();
        userphone = loginModel!.data!.data!.mobileNo.toString();
        userId = loginModel!.data!.data!.userId.toString();
        token = loginModel!.data!.token.toString();
        email = loginModel!.data!.data!.email.toString();
        print(userId);
        print(userToken);
        print(username);
        print(userphone);

        getStorage.write("usernumber", userphone);
        getStorage.write("username", username);
        getStorage.write("email", email);
        getStorage.write("userId", userId);
        getStorage.write("token", token);

        Get.to(const HomePage());
      } else {
        Get.to(RegisterPage(
          number: phone.toString(),
        ));
        // Get.snackbar(
        //   backgroundColor: Colors.white,
        //   'Mobile number does not exist',
        //   'Please register and login',
        // );
      }
    } catch (e) {
      // Get.snackbar(
      //   backgroundColor: Colors.white,
      //   "Mobile number already exist",
      //   'Try with another number',
      // );
      print(e.toString());
    } finally {
      isLoginLoading(false);
    }
  }
}
