import 'package:get/get.dart';
import 'package:smiley_foods/AuthScreen/login_page.dart';
import 'package:smiley_foods/AuthScreen/register_page.dart';
import 'package:smiley_foods/AuthScreen/verification_page.dart';
import 'package:smiley_foods/HomeScreen/add_card_page.dart';
import 'package:smiley_foods/HomeScreen/address_page.dart';
import 'package:smiley_foods/HomeScreen/cart_page.dart';
import 'package:smiley_foods/HomeScreen/categories_page.dart';
import 'package:smiley_foods/HomeScreen/congratulation_animation_page.dart';
import 'package:smiley_foods/HomeScreen/edit_profile_page.dart';
import 'package:smiley_foods/HomeScreen/food_detail.dart';
import 'package:smiley_foods/HomeScreen/food_screen.dart';
import 'package:smiley_foods/HomeScreen/home_page.dart';
import 'package:smiley_foods/HomeScreen/my_order_page.dart';
import 'package:smiley_foods/HomeScreen/open_restaurants_page.dart';
import 'package:smiley_foods/HomeScreen/payment_page1.dart';
import 'package:smiley_foods/HomeScreen/profile.dart';
import 'package:smiley_foods/HomeScreen/restaurant_overview_page.dart';
import 'package:smiley_foods/HomeScreen/track_order_page.dart';
import 'package:smiley_foods/OnboardingScreen/onboarding_view.dart';

class RoutesClass {
  static String approute = '/';
  static final route = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(
        name: '/onboarding',
        page: () => const OnboardingScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/Login',
        page: () => LoginScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/Otp',
        page: () => VerificationPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/Register',
        page: () => RegisterPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/Home',
        page: () => const HomePage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.downToUp),
    GetPage(
        name: '/Profile',
        page: () => ProfilePage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/MyOrderPage',
        page: () => const MyOrderPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/AddressPage',
        page: () => const AddressPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.leftToRight),
    GetPage(
        name: '/EditProfilePage',
        page: () => const EditProfilePage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.leftToRight),
    GetPage(
        name: '/Categories',
        page: () => CategoriesPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/FoodScreen',
        page: () => const FoodScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/FoodDetail',
        page: () => FoodDetail(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/OpenRestaurant',
        page: () => const OpenRestaurantPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    // GetPage(
    //     name: '/RestaurantView',
    //     page: () => RestaurantViewPage(),
    //     transitionDuration: const Duration(milliseconds: 200),
    //     transition: Transition.rightToLeft),
    GetPage(
        name: '/RestaurantOverView',
        page: () => RestaurantOverviewPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/CartPage',
        page: () => const CartPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/PaymentPage',
        page: () => const PaymentPage1(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/AddCardPage',
        page: () => const AddCardPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/TrackOrderPage',
        page: () => const TrackOrderPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/CongratulationPage',
        page: () => const CongratulationAnimationPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/TrackOrderScreen',
        page: () => const TrackOrderPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/',
        page: () => const TrackOrderPage(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft),
  ];
}
