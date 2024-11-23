import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
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
  List<Map<String, dynamic>> products1 = [
    {
      "name1": "Chicken",
      "image1": "assets/images/chicken.png",
      "restaurant": "Rose Restaurant",
      "price": "75"
    },
    {
      "name1": "Hot Dog",
      "image1": "assets/images/hot-dog.png",
      "restaurant": "Golden Restaurant",
      "price": "55"
    },
    {
      "name1": "Burger",
      "image1": "assets/images/burger.png",
      "restaurant": "Alo Restaurant",
      "price": "85"
    },
    {
      "name1": "Samosa",
      "image1": "assets/images/samosa.png",
      "restaurant": "Hub Restaurant",
      "price": "65"
    },
  ];

  int selectedIndex = -1;

  var item = ['Burger', 'Chicken', 'Hot dog', 'Samosa'];
  String dropdownvalue = 'Burger';
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
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_new))),
                  const SizedBox(width: 15),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(
                            dropdownColor: primaryColor,
                            underline: const SizedBox(),
                            value: dropdownvalue,
                            borderRadius: BorderRadius.circular(20),
                            items: item.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              );
                            }).toList(),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            })
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 55,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: primaryColorNevyBlue, shape: BoxShape.circle),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 55,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        Icons.tune,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
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
                height: MediaQuery.of(context).size.height / 1.8,
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
                      child: Stack(
                        children: [
                          Container(
                              height: 220,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
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
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 60,
                                              ),
                                              Text(
                                                products1[index]["name1"],
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                products1[index]["restaurant"],
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(children: [
                                                      const TextSpan(
                                                          text: "\$",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      TextSpan(
                                                          text: products1[index]
                                                              ["price"],
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ]),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                        height: 40,
                                                        decoration:
                                                            const BoxDecoration(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        products1[index]["image1"],
                                        height: 90,
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
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
                    "Open Restaurants",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.15,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurant.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WidgetAnimator(
                            incomingEffect:
                                WidgetTransitionEffects.incomingSlideInFromLeft(
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
