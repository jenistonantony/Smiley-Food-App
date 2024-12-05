import 'package:flutter/material.dart';

import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/food_detail.dart';
import 'package:smiley_foods/HomeScreen/restaurant_view_page.dart';
import 'package:smiley_foods/ItemScreen/product1_item.dart';
import 'package:smiley_foods/ItemScreen/product2_item.dart';
import 'package:smiley_foods/ItemScreen/restaurant_item.dart';

import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class OpenRestaurantPage extends StatefulWidget {
  const OpenRestaurantPage({super.key});

  @override
  State<OpenRestaurantPage> createState() => _OpenRestaurantPageState();
}

class _OpenRestaurantPageState extends State<OpenRestaurantPage> {
  final restaurantItemController = RestaurantItem(image: "", name: "");
  final product1InfoController =
      Product1Item(name1: '', image1: '', restaurant: '', price: '');
  int selectedIndex = -1;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  itemCount: restaurantItem.length,
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
                            Row(
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
                                              restaurantItem[index]
                                                  ["images"],
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
                                          restaurantItem[index]["names"],
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
                            ),
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
                    products1Item.length,
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
                                            products1Item[index]["image1"]),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                products1Item[index]["name1"],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                products1Item[index]["restaurant"],
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
