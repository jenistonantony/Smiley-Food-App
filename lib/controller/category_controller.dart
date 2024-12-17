import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:smiley_foods/baseurl.dart';
import 'package:smiley_foods/const.dart';
import 'package:smiley_foods/model/category_model.dart';

class CategoryController extends GetxController {
  CategoryModel? productModel;
  var isDataLoading = false.obs;
  Future productGet(String? code) async {
    print(userId);
    try {
      isDataLoading(true);

      var response = await http.get(
        Uri.parse(ApiDomain.category),
        headers: <String, String>{
          "userId": "675fcfb09df067f6f7b900f1",
          "Authorization":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzVmY2ZiMDlkZjA2N2Y2ZjdiOTAwZjEiLCJtb2JpbGVObyI6Ijk2Mzg1Mjc0MTIiLCJpYXQiOjE3MzQzMzIzMzYsImV4cCI6MTczNDQxODczNn0.tyMPMNIMPA5vwbkhhFKDqodn2A5ufpJQY4zb7TVZ7L8",
          "Content-Type": "application/json",
        },
        // headers: {},+
        // body: {"pincode": code}
      );
      print('product cateogory response${response.statusCode}');
      print('product cateogory response${response.body}');

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var result = jsonDecode(response.body);
        productModel = CategoryModel.fromJson(result);
        print(productModel!.data!.length);
      } else {
        productModel == null;
      }
    } catch (e) {
      print("${e.toString}");
    } finally {
      isDataLoading(false);
    }
  }
}
