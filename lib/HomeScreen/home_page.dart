import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/categories_page.dart';
import 'package:smiley_foods/ItemScreen/product2_item.dart';
import 'package:smiley_foods/ItemScreen/restaurant_item.dart';

import 'package:smiley_foods/controller/banner_controller.dart';
import 'package:smiley_foods/controller/category_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final restaurantItemController = RestaurantItem();
  final product2InfoController = Product2Item();
  int selectedIndex = -1;
  CategoryController product = Get.put(CategoryController());
  final TextEditingController controller = TextEditingController();
  BannerController bannerController = Get.put(BannerController());

  int _current = 0;
  int currentIndex = 0;
  List<Widget> body = [
    const Icon(Icons.person),
    const Icon(Icons.person),
    const Icon(Icons.person),
    const Icon(Icons.person),
  ];
  // @override
  // void initState() {
  //   product.productGet(pincode);
  //   // TODO: implement initState
  //   super.initState();
  // }

  final isDataLoading = false.obs;
  // final RxList products1Item = [].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: InkWell(
                onTap: () {
                  Get.toNamed('/Profile');
                },
                child: const Icon(
                  Icons.person,
                ),
              ),
              label: "Profile",
            ),
            const BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
                backgroundColor: primaryColor,
                icon: InkWell(
                    onTap: () {
                      Get.toNamed('/MyOrderPage');
                    },
                    child: const Icon(Icons.shopping_bag_outlined)),
                label: "Order"),
            const BottomNavigationBarItem(
                backgroundColor: primaryColor,
                icon: Icon(Icons.settings),
                label: "Setting"),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Builder(
                    builder: (BuildContext context) {
                      return Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/icon/icon.png",
                          ));
                    },
                  ),
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
                    height: 45,
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
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: primaryColor),
                            child: const Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
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
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoriesPage()));
                            },
                            child: const Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
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
                                  products2Item[index]["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                products2Item[index]["name"],
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
              Obx((() {
                if (bannerController.isDataLoading.isTrue) {
                  return Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                          color: primaryColor, size: 200));
                } else if (bannerController.bannermodel == null) {
                  return const SizedBox();
                }
                return Stack(
                  alignment: Alignment
                      .bottomCenter, // Align the indicator at the bottom
                  children: [
                    CarouselSlider(
                      items: bannerController.bannermodel!.data!.data!.map((e) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: 200,
                            width: 450, // Adjust width to match your needs
                            child: FadeInImage(
                              placeholder: const AssetImage(
                                  'assets/images/food1.jpg'), // Your placeholder image
                              image: NetworkImage(e.imageUrl.toString()),
                              fit: BoxFit.cover,
                              height: 200,
                              width: 450,
                              fadeInDuration: const Duration(milliseconds: 300),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                              placeholderErrorBuilder:
                                  (context, error, stackTrace) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 6.2,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: bannerController.bannermodel!.data!.data!
                            .asMap()
                            .entries
                            .map((entry) {
                          return GestureDetector(
                            // onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color.fromARGB(
                                            255, 160, 157, 157)
                                        : Colors.white)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              })),
            ],
          ),
        ),
      ),
    );
  }
}

// Obx(
              //   () {
              //     if (product.isDataLoading.isTrue) {
              //       return const Center(child: CircularProgressIndicator());
              //     }

              //     return Column(
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             const Text(
              //               "Open Restaurants",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 18),
              //             ),
              //             GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) =>
              //                         const OpenRestaurantPage(),
              //                   ),
              //                 );
              //               },
              //               child: const Row(
              //                 children: [
              //                   Text(
              //                     "See All",
              //                     style: TextStyle(
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.bold,
              //                       color: primaryColor,
              //                     ),
              //                   ),
              //                   Icon(
              //                     Icons.arrow_forward_ios_rounded,
              //                     size: 20,
              //                     color: Colors.grey,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 200,
              //           child: ListView.builder(
              //             physics: const NeverScrollableScrollPhysics(),
              //             shrinkWrap: true,
              //             itemCount: product.productModel!.data!.length,
              //             itemBuilder: (BuildContext context, int index) {
              //                return InkWell(
              //                 onTap: () {
              //                   Get.to(RestaurantOverviewPage(
              //                     imagePath:product.productModel!.data![index].imgUrl ?? "",
              //                     namepath: product.productModel!.data![index].categoryName ?? "Unknown",
              //                   ));
              //                 },
              //                 child: Container(
              //                   margin:
              //                       const EdgeInsets.symmetric(vertical: 10),
              //                   decoration: BoxDecoration(
              //                     color: Colors.grey.shade200,
              //                     borderRadius: BorderRadius.circular(20),
              //                   ),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Container(
              //                         height: 100,
              //                         decoration: BoxDecoration(
              //                           image: DecorationImage(
              //                             fit: BoxFit.cover,
              //                             image: product.productModel!.data![index].imgUrl != null
              //                                 ? AssetImage(product.productModel!.data![index].imgUrl.toString())
              //                                 : const AssetImage(
              //                                         'assets/images/placeholder.png')
              //                                     as ImageProvider,
              //                           ),
              //                           borderRadius:
              //                               const BorderRadius.vertical(
              //                             top: Radius.circular(20),
              //                             bottom: Radius.circular(20),
              //                           ),
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.all(10.0),
              //                         child: Text(
              //                          product.productModel!.data![index].categoryName?? "Unknown Category",
              //                           style: const TextStyle(
              //                             fontSize: 18,
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              // ),
