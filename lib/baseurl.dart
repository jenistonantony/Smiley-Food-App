class ApiDomain {
  static String baseurl =
      "http://ec2-65-0-134-237.ap-south-1.compute.amazonaws.com:8000/";

  static String token = "${baseurl}auth/token";
  static String otp = "${baseurl}users/send/otp";
  static String register = "${baseurl}users/register";
  static String phoneValidation = "${baseurl}users/validate";
}
