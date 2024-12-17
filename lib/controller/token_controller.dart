import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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

  // var isRegisterLoading = false.obs;

  // void register({
  //   required String name,
  //   required String email,
  //   required String phone,
  // }) async {
  //   try {
  //     isRegisterLoading(true);

  //     // Construct the request body
  //     final requestBody = {
  //       "name": name,
  //       "email": email,
  //       "mobileNo": phone,
  //       "registeredType": "app",
  //       "role": "consumer",
  //     };

  //     // Send the POST request
  //     final response = await post(
  //       Uri.parse(ApiDomain.register),
  //       headers: {"Content-Type": "application/json"},
  //       body: requestBody,
  //     );

  //     // Log response status and body for debugging
  //     print("Response Code: ${response.statusCode}");
  //     print("Response Body: ${response.body}");

  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);

  //       // Check API response status
  //       if (data["status"] == false) {
  //         Get.snackbar(
  //           "Registration Error",
  //           data["message"].toString(),
  //           backgroundColor: Colors.white,
  //         );
  //       } else {
  //         // Parse response and save user details
  //         final registerModel = RegisterModel.fromJson(data);

  //         // Extract user details
  //         final userId = registerModel.data?.userId;
  //         final userName = registerModel.data?.userName;
  //         final userPhone = registerModel.data?.mobileNo;
  //         final userEmail = registerModel.data?.email;
  //         final userToken = registerModel.data?.token;

  //         // Save user details to local storage
  //         await getStorage.write("userId", userId);
  //         await getStorage.write("userName", userName);
  //         await getStorage.write("userPhone", userPhone);
  //         await getStorage.write("userEmail", userEmail);
  //         await getStorage.write("token", userToken);

  //         // Navigate to the LoginScreen
  //         Get.to(() => LoginScreen(
  //               verificationId: '',
  //             ));
  //       }
  //     } else {
  //       // Handle non-200 response codes
  //       Get.snackbar(
  //         "Registration Failed",
  //         "Mobile number already exists or invalid details provided.",
  //         backgroundColor: Colors.white,
  //       );
  //     }
  //   } catch (e) {
  //     // Handle exceptions
  //     Get.snackbar(
  //       "Error",
  //       "An unexpected error occurred: $e",
  //       backgroundColor: Colors.white,
  //     );
  //     print("Exception: $e");
  //   } finally {
  //     isRegisterLoading(false);
  //   }
  // }
}
