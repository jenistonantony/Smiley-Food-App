import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/payment_page1.dart';
import 'package:smiley_foods/ItemScreen/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final addressController = TextEditingController();
  final cartItemController =
      CartItem(name1: '', image1: '', restaurant: '', price: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded))),
                      const SizedBox(width: 15),
                      const Text(
                        "Cart",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "DONE",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: primaryColorgreen,
                              decorationThickness: 2,
                              color: primaryColorgreen,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: cartitem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(2, 3),
                                      color: Color.fromARGB(255, 218, 211, 211),
                                      spreadRadius:
                                          BorderSide.strokeAlignOutside,
                                      blurRadius: BorderSide.strokeAlignOutside)
                                ],
                                color: primarygreyshade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 15),
                                  child: Container(
                                    height: 120,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(2, 3),
                                            color: Color.fromARGB(
                                                255, 218, 211, 211),
                                            spreadRadius:
                                                BorderSide.strokeAlignOutside,
                                            blurRadius:
                                                BorderSide.strokeAlignOutside)
                                      ],
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      cartitem[index]["image1"],
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            cartitem[index]["name1"],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      RichText(
                                        text: TextSpan(children: [
                                          const TextSpan(
                                              text: "\$",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: cartitem[index]["price"],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Text(
                                            "14''",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: primaryColor),
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              )),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "2",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: primaryColor),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Edit Item",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Remove",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Row(
              children: [
                Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: primarygreyshade200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "DELIVERY ADDRESS",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: primarygreyshade600),
                                ),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "EDIT",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: primaryColor,
                                          decorationThickness: 2,
                                          color: primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextFormField(
                                    controller: addressController,
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: const InputDecoration(
                                        hintText: "Enter the address",
                                        hintStyle: TextStyle(
                                            color: primarygreyshade600),
                                        border: InputBorder.none),
                                  ),
                                )),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text(
                                  "TOTAL:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: primarygreyshade600),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "\$140",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Row(
                                    children: [
                                      Text(
                                        "Breakdown",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_sharp,
                                        color: primaryColor,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentPage1()));
                              },
                              child: Container(
                                height: 55,
                                width: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: primaryColor),
                                child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "PLACE ORDER",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
