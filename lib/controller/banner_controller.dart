import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:smiley_foods/baseurl.dart';
import 'package:smiley_foods/const.dart';
import 'package:smiley_foods/model/banner_model.dart';

class BannerController extends GetxController {
  BannerModel? bannermodel;
  var isDataLoading = false.obs;
  Future bannerGet(String? picode) async {
    String userid = getStorage.read("userId");
    String usertoken = getStorage.read("token");
    // print(userId);
    try {
      isDataLoading(true);

      var response = await http.get(
        Uri.parse(ApiDomain.bannerGet),
        headers: <String, String>{
          "userId": "676045529df067f6f7b901cf",
          "Authorization":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzYwNDU1MjlkZjA2N2Y2ZjdiOTAxY2YiLCJtb2JpbGVObyI6Ijk2Mzg1Mjc0MTMiLCJpYXQiOjE3MzQzNjI0NTAsImV4cCI6MTczNDQ0ODg1MH0.gnQ5WQH3JNhHL6YI6kDOtF5IUnzlzPPGDXW1SA1500Q",
          "Content-Type": "application/json",
        },
      );
      //  print('banner address response${response.statusCode}');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var result = jsonDecode(response.body);

        bannermodel = BannerModel.fromJson(result);
        // bannerModel = bannermodel.fromJson(result);
        print(bannermodel!.data!.data![0].imageUrl);
      } else {
        bannermodel == null;
        //print(response.body.toString());
      }
    } catch (e) {
      //   print("error");
    } finally {
      isDataLoading(false);
    }
  }
}
