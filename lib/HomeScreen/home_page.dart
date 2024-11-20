import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  TextButton(
                    onPressed: () {},
                    child: const Column(
                      children: [
                        Row(
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
                      ],
                    ),
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
                                blurRadius: BorderSide.strokeAlignOutside,
                                blurStyle: BlurStyle.outer)
                          ],
                          color: selectedIndex == index
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                ),
                                child: Image.asset(
                                  products[index]["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                products[index]["name"],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Open Restaurants",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Column(
                      children: [
                        Row(
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurant.length,
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
                            WidgetAnimator(
                              incomingEffect: WidgetTransitionEffects
                                  .incomingSlideInFromLeft(
                                      delay: const Duration(seconds: 1)),
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage(restaurant[index]["images"]),
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
                                      restaurant[index]["names"],
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
