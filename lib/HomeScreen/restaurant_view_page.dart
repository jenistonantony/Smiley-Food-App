import 'package:flutter/material.dart';

class RestaurantViewPage extends StatefulWidget {
  const RestaurantViewPage({super.key});

  @override
  State<RestaurantViewPage> createState() => _RestaurantViewPageState();
}

class _RestaurantViewPageState extends State<RestaurantViewPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("restaurant  View Page")],
      )),
    );
  }
}
