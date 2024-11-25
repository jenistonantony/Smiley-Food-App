import 'package:flutter/material.dart';
import 'package:smiley_foods/Components/color.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool _isFavorited = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios_new_rounded))),
                const SizedBox(width: 15),
                const Text(
                  "Detail",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 155,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade300,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                  Positioned(
                      left: 80,
                      bottom: 35,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/chicken.png",
                                height: 200,
                                width: 200,
                              ),
                            ],
                          ),
                        ],
                      )),
                  Positioned(
                      right: 25,
                      bottom: 20,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 247, 192, 148)),
                        child: IconButton(
                          color: _isFavorited ? primaryColor : Colors.white,
                          onPressed: _toggleFavorite,
                          icon: Icon(_isFavorited
                              ? Icons.favorite
                              : Icons.favorite_border),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alo Restaurant",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "A simple restaurant provides good food at low cost in a casual, relaxed setting, focusing on quick service and everyday meals.",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/star.png",
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    const Text("4.7"),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/images/delivery-truck.png",
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    const Text("Free"),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/images/clock.png",
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    const Text("20 min"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
