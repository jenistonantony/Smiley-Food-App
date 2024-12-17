import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/food_screen.dart';
import 'package:smiley_foods/HomeScreen/open_restaurants_page.dart';
import 'package:smiley_foods/ItemScreen/product2_item.dart';
import 'package:smiley_foods/ItemScreen/restaurant_item.dart';
import 'package:smiley_foods/fontStyle.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({
    super.key,
  });

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final restaurantItemController = RestaurantItem();

  final product1InfoController = products2Item;
  int selectedIndex = -1;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: primaryColor,
          child: Text(
            "All Categories",
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
              const SizedBox(height: 20),
              Row(
                children: [
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "Hey Smiley Foods,",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: " Good Afternoon!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ]),
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
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search dishes, restaurant",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search),
                    ),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FoodScreen()));
                        },
                        child: const Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 150,
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
                                blurRadius: BorderSide.strokeAlignOutside,
                                blurStyle: BlurStyle.outer)
                          ],
                          color: selectedIndex == index
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    WidgetAnimator(
                                      incomingEffect: WidgetTransitionEffects
                                          .incomingSlideInFromTop(
                                              duration:
                                                  const Duration(seconds: 2)),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    products2Item[index]
                                                        ["image"]))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        WidgetAnimator(
                                          incomingEffect:
                                              WidgetTransitionEffects
                                                  .incomingSlideInFromBottom(
                                                      duration: const Duration(
                                                          seconds: 3)),
                                          child: Text(
                                            products2Item[index]["name"],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    WidgetAnimator(
                                      incomingEffect: WidgetTransitionEffects
                                          .incomingSlideInFromBottom(
                                              duration:
                                                  const Duration(seconds: 4)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Starting",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children: [
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    const TextSpan(
                                                        text: "\$",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextSpan(
                                                        text:
                                                            products2Item[index]
                                                                ["price"],
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ]))
                                                ],
                                              )
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
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Open Restaurants",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OpenRestaurantPage()));
                        },
                        child: const Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 850,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurantItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      restaurantItem[index]["images"]),
                                ),
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20),
                                    bottom: Radius.circular(20)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurantItem[index]["names"],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Burger - Chicken - Rice - Wings",
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
                                      Image.asset(
                                        "assets/images/delivery-truck.png",
                                        height: 20,
                                      ),
                                      const SizedBox(width: 10),
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
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
