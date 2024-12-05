// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:smiley_foods/AuthScreen/verification_page.dart';
// import 'package:smiley_foods/Components/color.dart';
// import 'package:smiley_foods/baseurl.dart';
// import 'package:smiley_foods/const.dart';

// class LoginController extends GetxController {
//   var isDataLoading = false.obs;
//   Future login({dynamic mobileNo}) async {
//     try {
//       isDataLoading(true);
//       var response =
//           await http.post(Uri.parse(ApiDomain.otp), headers: <String, String>{
//         "userid": userId,
//         "Authorization": userToken
//       }, body: {
//         "mobileNo": mobileNo,
//       });

//       print(response.statusCode.toString());

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());

//         print(response.statusCode);
//         print(response.body);

//         // String signinotpvalue = data["data"]["otp"].toString();
//         getStorage.write("signinotpvalue", data["data"].toString());
//         signinotpvalue = getStorage.read("signinotpvalue");
//         print("mugesh${getStorage.read("signinotpvalue")}");
//         print(data["data"].toString());
//         print('hhhhh');
//         print(mobileNo);
//         //Get.to(MyLoadingScreen());

//         Get.to(VerificationPage(
//           phone: mobileNo,
//           otp: signinotpvalue,
//         ));
//       } else {
//         Get.snackbar(
//             backgroundColor: const Color.fromARGB(255, 248, 3, 3),
//             "Invalid",
//             'Please enter the number',
//             colorText: Colors.white);
//         print(response.body);
//       }
//     } catch (e) {
//       print(e);
//       Get.snackbar(
//         backgroundColor: primaryColor,
//         "Mobile number already exist",
//         'Try with another number',
//       );
//       print(e.toString());
//       // ignore: dead_code_catch_following_ca tch
//     } catch (e) {
//       print("$e");
//     } finally {
//       isDataLoading(false);
//     }
//   }

//   Future validateUser({String? phoneNumber}) async {
//     var response = await post((Uri.parse(ApiDomain.phoneValidation)),
//         headers: <String, String>{
//           "Accept": "/",
//           "Content-Type": "application/json; charset=utf-8"
//         },
//         body: jsonEncode(<String, dynamic>{
//           "mobileNo": phoneNumber.toString(),
//           "type": "mobile"
//         }));
//     print("validation user ${response.statusCode}");
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return true;
//     } else if (response.statusCode == 400) {
//       print(response.body);
//       var results = jsonDecode(response.body);
//       String mobileType = results["data"]["type"].toString();
//       if (mobileType.toString() == "consumer") {
//         // await getToken.generateToken(phonmeNumber: phoneNumber, isLogin: true);
//         return true;
//       } else {
//         return Get.defaultDialog(
//             title: 'Login failed',
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text("Delivey man Not allowed Consumer app",
//                     style: TextStyle()),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   "login with Consumer number",
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   child: Text(
//                     'Back',
//                     style: TextStyle(color: Colors.white, fontSize: 16.0),
//                   ),
//                 )
//               ],
//             ),
//             radius: 10.0);
//       }
//     } else {
//       print(response.body.toString());
//       return false;
//       // Get.offAll(const RegisterUser());
//     }
//   }
// }
