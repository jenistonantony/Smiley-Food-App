import 'package:flutter/material.dart';
import 'package:smiley_foods/Components/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
