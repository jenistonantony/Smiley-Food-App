
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/food_detail.dart';
import 'package:smiley_foods/HomeScreen/restaurant_view_page.dart';

import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class OpenRestaurantPage extends StatefulWidget {
  const OpenRestaurantPage({super.key});

  @override
  State<OpenRestaurantPage> createState() => _OpenRestaurantPageState();
}

class _OpenRestaurantPageState extends State<OpenRestaurantPage> {
  List<Map<String, dynamic>> restaurant = [
    {
      "names": "Rose Restaurant",
      "images": "assets/images/restaurant1.jpg",
    },
    {
      "names": "Golden Restaurant",
      "images": "assets/images/restaurant2.jpg",
    },
    {
      "names": "Alo Restaurant",
      "images": "assets/images/restaurant3.jpg",
    },
  ];

  List<Map<String, dynamic>> products = [
    {"name": "All", "image": "assets/images/fire.png"},
    {"name": "Hot Dog", "image": "assets/images/hot-dog.png"},
    {"name": "Burger", "image": "assets/images/burger.png"},
    {"name": "Samosa", "image": "assets/images/samosa.png"},
    {"name": "Chicken", "image": "assets/images/chicken.png"},
  ];
  List<Map<String, dynamic>> products1 = [
    {
      "name1": "Chicken",
      "image1": "assets/images/chicken.png",
      "restaurant": "Rose Restaurant"
    },
    {
      "name1": "Hot Dog",
      "image1": "assets/images/hot-dog.png",
      "restaurant": "Golden Restaurant"
    },
    {
      "name1": "Burger",
      "image1": "assets/images/burger.png",
      "restaurant": "Alo Restaurant"
    },
    {
      "name1": "Samosa",
      "image1": "assets/images/samosa.png",
      "restaurant": "Hub Restaurant"
    },
  ];
  int selectedIndex = -1;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu))),
                  const SizedBox(width: 15),
                  const Text(
                    "Search",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                    height: 55,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 30, 53),
                        shape: BoxShape.circle),
                    child: Stack(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          left: 5.6,
                          bottom: 28,
                          child: Container(
                            height: 25,
                            decoration: const BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    // showCursor: false,
                    keyboardType: TextInputType.multiline,
                    controller: controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search dishes, restaurant",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.close,
                              size: 20,
                            ))),
                  )),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Keywords",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                    products.length,
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
                                products[index]["name"],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Suggested Restaurants",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 470,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurant.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RestaurantViewPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetAnimator(
                                incomingEffect: WidgetTransitionEffects
                                    .incomingSlideInFromLeft(
                                        delay: const Duration(seconds: 1)),
                                child: Row(
                                  children: [
                                    WidgetAnimator(
                                      incomingEffect: WidgetTransitionEffects
                                          .incomingSlideInFromLeft(
                                              duration:
                                                  const Duration(seconds: 1)),
                                      child: Container(
                                        height: 120,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  restaurant[index]["images"],
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          WidgetAnimator(
                                            incomingEffect:
                                                WidgetTransitionEffects
                                                    .incomingSlideInFromRight(
                                                        delay: const Duration(
                                                            seconds: 2)),
                                            child: Text(
                                              restaurant[index]["names"],
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              WidgetAnimator(
                                                incomingEffect:
                                                    WidgetTransitionEffects
                                                        .incomingSlideInFromRight(
                                                            delay:
                                                                const Duration(
                                                                    seconds:
                                                                        3)),
                                                child: Image.asset(
                                                  "assets/images/star.png",
                                                  height: 20,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              WidgetAnimator(
                                                incomingEffect:
                                                    WidgetTransitionEffects
                                                        .incomingSlideInFromRight(
                                                            delay:
                                                                const Duration(
                                                                    seconds:
                                                                        3)),
                                                child: const Text(
                                                  "4.7",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                children: [
                  Text(
                    "Popular Fast Food",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.83,
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
                    products1.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodDetail()));
                        // setState(() {
                        //   selectedIndex = index;
                        // });
                      },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                            )
                          ],
                          // color: selectedIndex == index
                          //     ? primaryColor
                          //     : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            products1[index]["image1"]),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                products1[index]["name1"],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                products1[index]["restaurant"],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
