import 'package:flutter/material.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/cart_page.dart';
import 'package:smiley_foods/ItemScreen/detail_item.dart';
import 'package:smiley_foods/fontStyle.dart';

class FoodDetail extends StatefulWidget {
  String? imagePath;
  String? namePath;
  String? restaurantPath;
  FoodDetail({super.key, this.imagePath, this.namePath, this.restaurantPath});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  final detailItemController = DetailItem();
  bool _isFavorited = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: primaryColor,
          child: Text(
            "Detail",
            style: Heading,
          ),
        ),
        backgroundColor: lightGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
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
                                      widget.imagePath.toString(),
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
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 247, 192, 148)),
                              child: IconButton(
                                color:
                                    _isFavorited ? primaryColor : Colors.white,
                                onPressed: _toggleFavorite,
                                icon: Icon(_isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.food_bank),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.namePath.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.restaurantPath.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "SIZE:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                        child: const Center(
                            child: Text(
                          "10'' ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                        child: const Center(
                            child: Text(
                          "14'' ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                        child: const Center(
                            child: Text(
                          "16'' ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text("INGRIDENTS",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: detailItemController.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    detailItemController.images[index].image,
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade200),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$32",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.white),
                                                child:
                                                    const Icon(Icons.remove)),
                                          ],
                                        )),
                                    const Text(
                                      "2",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.white),
                                                child: const Icon(Icons.add)),
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()));
                      },
                      child: Container(
                        height: 45,
                        width: 180,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
