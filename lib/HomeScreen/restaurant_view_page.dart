// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_grid_list/responsive_grid_list.dart';
// import 'package:smiley_foods/Components/color.dart';
// import 'package:smiley_foods/HomeScreen/restaurant_overview_page.dart';

// import 'package:smiley_foods/ItemScreen/product1_item.dart';
// import 'package:smiley_foods/ItemScreen/product2_item.dart';
// import 'package:smiley_foods/ItemScreen/restaurant_item.dart';
// import 'package:smiley_foods/fontStyle.dart';

// class RestaurantViewPage extends StatefulWidget {
//   String? imagePath;
//   String? namepath;
//   RestaurantViewPage({super.key, this.imagePath, this.namepath});

//   @override
//   State<RestaurantViewPage> createState() => _RestaurantViewPageState();
// }

// class _RestaurantViewPageState extends State<RestaurantViewPage> {
//   int index = 0;
//   int selectedIndex = -1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Title(
//           color: primaryColor,
//           child: Text(
//             "Restaurant View",
//             style: Heading,
//           ),
//         ),
//         actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
//         backgroundColor: lightGrey,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.to(RestaurantOverviewPage(
//                     imagePath: restaurantItem[index]["foodimages"],
//                     namepath: restaurantItem[index]["names"],
//                   ));
//                 },
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.all(10),
//                       height: 160,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage(widget.imagePath.toString()),
//                         ),
//                         borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(20),
//                             bottom: Radius.circular(20)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.namepath.toString(),
//                             style: const TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             "A simple restaurant provides good food at low cost in a casual, relaxed setting, focusing on quick service and everyday meals.",
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: [
//                               Image.asset(
//                                 "assets/images/star.png",
//                                 height: 20,
//                               ),
//                               const SizedBox(width: 5),
//                               const Text("4.7"),
//                               const SizedBox(width: 10),
//                               Image.asset(
//                                 "assets/images/delivery-truck.png",
//                                 height: 20,
//                               ),
//                               const SizedBox(width: 5),
//                               const Text("Free"),
//                               const SizedBox(width: 10),
//                               Image.asset(
//                                 "assets/images/clock.png",
//                                 height: 20,
//                               ),
//                               const SizedBox(width: 5),
//                               const Text("20 min"),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 50,
//                 child: ResponsiveGridList(
//                   listViewBuilderOptions: ListViewBuilderOptions(
//                     scrollDirection: Axis.horizontal,
//                   ),
//                   horizontalGridMargin: 10,
//                   verticalGridMargin: 10,
//                   minItemWidth: 100,
//                   children: List.generate(
//                     products2Item.length,
//                     (index) => GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           boxShadow: const [
//                             BoxShadow(
//                               color: primaryColor,
//                             )
//                           ],
//                           color: selectedIndex == index
//                               ? primaryColor
//                               : Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 products2Item[index]["name"],
//                                 style: const TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.bold),
//                                 overflow: TextOverflow.clip,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       "Dishes (4)",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 2,
//                 child: ResponsiveGridList(
//                   listViewBuilderOptions: ListViewBuilderOptions(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: false,
//                   ),
//                   maxItemsPerRow: 2,
//                   horizontalGridMargin: 10,
//                   verticalGridMargin: 1,
//                   minItemWidth: 100,
//                   children: List.generate(
//                     products1Item.length,
//                     (index) => GestureDetector(
//                       onTap: () {},
//                       child: Stack(
//                         children: [
//                           Container(
//                               height: 180,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Container(
//                                         height: 140,
//                                         width: 200,
//                                         decoration: BoxDecoration(
//                                             color: Colors.grey.shade200,
//                                             borderRadius:
//                                                 BorderRadius.circular(20)),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 18),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               const SizedBox(
//                                                 height: 60,
//                                               ),
//                                               Text(
//                                                 products1Item[index]["name1"],
//                                                 style: const TextStyle(
//                                                     fontSize: 15,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               const SizedBox(height: 10),
//                                               Text(
//                                                 products1Item[index]
//                                                     ["restaurant"],
//                                                 style: const TextStyle(
//                                                     fontSize: 13,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.grey),
//                                               ),
//                                               // Row(
//                                               //   mainAxisAlignment:
//                                               //       MainAxisAlignment.start,
//                                               //   children: [
//                                               //     RichText(
//                                               //       text: TextSpan(children: [
//                                               //         const TextSpan(
//                                               //             text: "\$",
//                                               //             style: TextStyle(
//                                               //                 color:
//                                               //                     Colors.black,
//                                               //                 fontWeight:
//                                               //                     FontWeight
//                                               //                         .bold)),
//                                               //         TextSpan(
//                                               //             text: products1Item[
//                                               //                 index]["price"],
//                                               //             style: const TextStyle(
//                                               //                 color:
//                                               //                     Colors.black,
//                                               //                 fontWeight:
//                                               //                     FontWeight
//                                               //                         .bold)),
//                                               //       ]),
//                                               //     ),
//                                               //     const Spacer(),
//                                               //     GestureDetector(
//                                               //       onTap: () {},
//                                               //       child: Container(
//                                               //           height: 40,
//                                               //           decoration:
//                                               //               const BoxDecoration(
//                                               //                   color:
//                                               //                       primaryColor,
//                                               //                   shape: BoxShape
//                                               //                       .circle),
//                                               //           child: const Icon(
//                                               //               Icons.add)),
//                                               //     )
//                                               //   ],
//                                               // )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Align(
//                             alignment: Alignment.topCenter,
//                             child: Image.asset(
//                               products1Item[index]["image1"],
//                               height: 90,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
