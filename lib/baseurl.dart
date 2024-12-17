class ApiDomain {
  static String baseurl =
      "http://ec2-65-1-106-84.ap-south-1.compute.amazonaws.com:8000/";

  static String token = "${baseurl}api/auth/token";
  static String otp = "${baseurl}api/user/send/otp";
  static String register = "${baseurl}api/user/register";
  static String phoneValidation = "${baseurl}api/user/validate";
  static String login = "${baseurl}api/user/app/login";
  static String category =
      "${baseurl}api/user/category?status=active&pinCode=629169&type=app";
  static String bannerGet = "${baseurl}api/banner?type=consumer&status=active";
}
