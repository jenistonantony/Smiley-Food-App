import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiley_foods/Components/color.dart';
import 'package:smiley_foods/HomeScreen/add_card_page.dart';
import 'package:smiley_foods/ItemScreen/payment1_item.dart';

class PaymentPage1 extends StatefulWidget {
  const PaymentPage1({super.key});

  @override
  State<PaymentPage1> createState() => _PaymentPage1State();
}

class _PaymentPage1State extends State<PaymentPage1> {
  final payment1ItemController = Payment1Item();
  int selectedIndex = -1;

  var item = ['cash on delivery', 'visa', 'Master Card', 'Rupay', 'Debit Card'];
  String dropdownvalue = 'Master Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(
              color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: payment1item.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selectedIndex == index
                                            ? primaryColor
                                            : lightGrey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: lightGrey),
                                child: Image.asset(
                                  payment1item[index]["paymentimage"],
                                ),
                              ),
                              Text(
                                payment1item[index]["paymentname"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedIndex == index
                                        ? primaryColor
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      offset: Offset(2, 3),
                      color: Color.fromARGB(255, 218, 211, 211),
                      spreadRadius: BorderSide.strokeAlignOutside,
                      blurRadius: BorderSide.strokeAlignOutside)
                ], color: lightGrey, borderRadius: BorderRadius.circular(20)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 25,
                          color: primaryColor,
                        ),
                        Text(
                          "Add New",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 200),
            Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "TOTAL:",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "  \$96",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCardPage()));
                  },
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "PAY & CONFIRM",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
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
