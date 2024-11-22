import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smiley_foods/AuthScreen/login_page.dart';
import 'package:smiley_foods/baseurl.dart';
import 'package:smiley_foods/model/register_model.dart';

// URL of the Register API

class RegisterController extends GetxController {
  ResigterModel? hub;
// Function to make a POST request
  Future registerUser({
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
        "registeredType": "app",
        "role": "consumer"
      };

      // Send the POST request
      var response = await http.post(
        Uri.parse(ApiDomain.register),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      // Check the response status
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body.toString());
        hub = ResigterModel.fromJson(result);
        Get.to(const LoginScreen());
        // Parse the JSON response into a Register object
      } else {
        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
