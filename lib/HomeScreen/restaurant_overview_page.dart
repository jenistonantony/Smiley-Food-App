import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/ItemScreen/product1_item.dart';
import 'package:smiley_foods/ItemScreen/product2_item.dart';
import 'package:smiley_foods/ItemScreen/restaurant_indicator_item.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RestaurantOverviewPage extends StatefulWidget {
  const RestaurantOverviewPage({super.key});

  @override
  State<RestaurantOverviewPage> createState() => _RestaurantOverviewPageState();
}

class _RestaurantOverviewPageState extends State<RestaurantOverviewPage> {
  int selectedIndex = -1;
  final restaurantIndicatorItem = RestaurantIndicatorItem();
  final pagecontroller = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    pagecontroller.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pagecontroller.hasClients) {
        final nextPage = (pagecontroller.page?.toInt() ?? 0) + 1;
        if (nextPage < restaurantIndicatorItem.images.length) {
          pagecontroller.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          pagecontroller.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                PageView.builder(
                  controller: pagecontroller,
                  itemCount: restaurantIndicatorItem.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          bottom: BorderSide.strokeAlignCenter),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              restaurantIndicatorItem.images[index].image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_back_ios_rounded),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SmoothPageIndicator(
                      controller: pagecontroller,
                      count: restaurantIndicatorItem.images.length,
                      effect: const WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        activeDotColor: Colors.orange,
                        dotColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              const SizedBox(height: 10),
                              const Text(
                                "Alo Restaurant",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "A simple restaurant provides good food at low cost in a casual, relaxed setting, focusing on quick service and everyday meals.",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ResponsiveGridList(
                        listViewBuilderOptions: ListViewBuilderOptions(
                          scrollDirection: Axis.horizontal,
                        ),
                        horizontalGridMargin: 10,
                        verticalGridMargin: 10,
                        minItemWidth: 100,
                        children: List.generate(
                          products2Item.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: primaryColor,
                                  )
                                ],
                                color: selectedIndex == index
                                    ? primaryColor
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      products2Item[index]["name"],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Dishes (4)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.75,
                      child: ResponsiveGridList(
                        listViewBuilderOptions: ListViewBuilderOptions(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: false,
                        ),
                        maxItemsPerRow: 2,
                        horizontalGridMargin: 10,
                        verticalGridMargin: 1,
                        minItemWidth: 100,
                        children: List.generate(
                          products1Item.length,
                          (index) => GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                    height: 210,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 165,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 60,
                                                    ),
                                                    Text(
                                                      products1Item[index]
                                                          ["name1"],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      products1Item[index]
                                                          ["restaurant"],
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                const TextSpan(
                                                                    text: "\$",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                TextSpan(
                                                                    text: products1Item[
                                                                            index]
                                                                        [
                                                                        "price"],
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ]),
                                                        ),
                                                        const Spacer(),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Container(
                                                              height: 40,
                                                              decoration: const BoxDecoration(
                                                                  color:
                                                                      primaryColor,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: const Icon(
                                                                  Icons.add)),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Positioned(
                                    bottom: 120,
                                    left: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              products1Item[index]["image1"],
                                              height: 90,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}