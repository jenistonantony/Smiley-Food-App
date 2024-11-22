// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:smiley_foods/HomeScreen/home_page.dart';
// import 'package:smiley_foods/baseurl.dart';
// import 'package:smiley_foods/model/login_model.dart';

// class LoginController extends GetxController {
//   LoginModel? hub;

//   // Function to log in the user
//   Future<void> loginUser({
//     required String mobileNo, // Make mobileNo required
//     String role = "consumer", // Default role as "consumer"
//   }) async {
//     try {
//       // Prepare the request body
//       final Map<String, dynamic> requestBody = {
//         "mobileNo": mobileNo,
//         "registeredType": "app",
//         "role": "consumer"
//       };

//       // Send the POST request
//       var response = await http.post(
//         Uri.parse(ApiDomain.login),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(requestBody),
//       );

//       // Check the response status
//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body.toString());
//         hub = LoginModel.fromJson(result);

//         // Navigate to HomePage
//         Get.toNamed(HomePage() as String);
//       } else {
//         // Handle server-side errors
//         print("Error: ${response.statusCode}");
//         print("Response: ${response.body}");

//         Get.snackbar(
//           "Login Failed",
//           "Error ${response.statusCode}: Unable to log in.",
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       // Handle exceptions
//       print("Exception: $e");

//       Get.snackbar(
//         "Error",
//         "An error occurred while logging in. Please try again later.",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
// }
