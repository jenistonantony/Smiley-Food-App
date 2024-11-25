import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/food_screen.dart';
import 'package:smiley_foods/HomeScreen/open_restaurants_page.dart';
import 'package:smiley_foods/ItemScreen/product2_item.dart';
import 'package:smiley_foods/ItemScreen/restaurant_item.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final restaurantItemController = RestaurantItem(image: "", name: "");

  final product1InfoController = products2Item;
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "DELIVERY TO",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "Smiley Lap office",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18, left: 5),
                    child: Icon(Icons.arrow_drop_down),
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
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurantItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Container(
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
                              child: Container(
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WidgetAnimator(
                                    incomingEffect: WidgetTransitionEffects
                                        .incomingSlideInFromLeft(
                                            delay: const Duration(seconds: 2)),
                                    child: Text(
                                      restaurantItem[index]["names"],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  WidgetAnimator(
                                    incomingEffect: WidgetTransitionEffects
                                        .incomingSlideInFromLeft(
                                            delay: const Duration(seconds: 3)),
                                    child: const Text(
                                      "Burger - Chicken - Rice - Wings",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      WidgetAnimator(
                                        incomingEffect: WidgetTransitionEffects
                                            .incomingSlideInFromLeft(
                                                delay:
                                                    const Duration(seconds: 4)),
                                        child: Image.asset(
                                          "assets/images/star.png",
                                          height: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      WidgetAnimator(
                                        incomingEffect: WidgetTransitionEffects
                                            .incomingSlideInFromLeft(
                                                delay:
                                                    const Duration(seconds: 4)),
                                        child: const Text("4.7"),
                                      ),
                                      const SizedBox(width: 10),
                                      WidgetAnimator(
                                        incomingEffect: WidgetTransitionEffects
                                            .incomingSlideInFromLeft(
                                                delay:
                                                    const Duration(seconds: 4)),
                                        child: Image.asset(
                                          "assets/images/delivery-truck.png",
                                          height: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      WidgetAnimator(
                                        incomingEffect: WidgetTransitionEffects
                                            .incomingSlideInFromLeft(
                                                delay:
                                                    const Duration(seconds: 4)),
                                        child: const Text("Free"),
                                      ),
                                      const SizedBox(width: 10),
                                      WidgetAnimator(
                                        incomingEffect: WidgetTransitionEffects
                                            .incomingSlideInFromLeft(
                                                delay:
                                                    const Duration(seconds: 4)),
                                        child: Image.asset(
                                          "assets/images/clock.png",
                                          height: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      WidgetAnimator(
                                        incomingEffect: WidgetTransitionEffects
                                            .incomingSlideInFromLeft(
                                                delay:
                                                    const Duration(seconds: 4)),
                                        child: const Text("20 min"),
                                      ),
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
