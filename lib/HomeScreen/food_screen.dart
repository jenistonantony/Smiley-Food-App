import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/restaurant_overview_page.dart';
import 'package:smiley_foods/ItemScreen/product1_item.dart';
import 'package:smiley_foods/ItemScreen/restaurant_item.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final restaurantItemController = RestaurantItem();
  final product1ItemController = Product1Item();

  int selectedIndex = -1;

  var item = ['Burger', 'Chicken', 'Hot dog', 'Samosa'];
  String dropdownvalue = 'Burger';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                ),
              ], color: primaryColor, borderRadius: BorderRadius.circular(20)),
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
            Container(
              height: 55,
              width: 50,
              decoration:
                  const BoxDecoration(color: nevyBlue, shape: BoxShape.circle),
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
            // Container(
            //   height: 55,
            //   width: 50,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.shade200, shape: BoxShape.circle),
            //   child: const Center(
            //     child: Icon(
            //       Icons.tune,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Popular Fast Food",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 450,
                child: ResponsiveGridList(
                  listViewBuilderOptions: ListViewBuilderOptions(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                  ),
                  maxItemsPerRow: 2,
                  // horizontalGridMargin: 10,
                  // verticalGridMargin: 1,
                  minItemWidth: 100,
                  children: List.generate(
                    products1Item.length,
                    (index) => GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 170,
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
                                                products1Item[index]["name1"],
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
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
                                                          text: products1Item[
                                                              index]["price"],
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
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              products1Item[index]["image1"],
                              height: 90,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
                height: MediaQuery.of(context).size.height / 1.05,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurantItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurantOverviewPage(
                                      imagePath: restaurantItem[index]
                                          ["images"],
                                      namepath: restaurantItem[index]["names"],
                                    )));
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
