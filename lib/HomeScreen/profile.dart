import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiley_foods/Components/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
            color: primaryColor,
            child: const Text(
              "Profile",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage:
                      AssetImage("assets/images/AntonyJeniston.jpg"),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Antony Jeniston",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "I Love Fast Food",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primarygreyshade600),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primarygreyshade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, color: primaryColor),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("Personal Info",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Get.toNamed('/EditProfilePage');
                            },
                            child:
                                const Icon(Icons.keyboard_arrow_right_rounded))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.location_city,
                            color: Colors.deepPurple),
                        const SizedBox(width: 20),
                        const Text("Address",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Get.toNamed('/AddressPage');
                            },
                            child:
                                const Icon(Icons.keyboard_arrow_right_rounded))
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primarygreyshade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Cart",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.purple),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Favourite",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.orange),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Notifications",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.location_city, color: Colors.blue),
                        SizedBox(width: 20),
                        Text("Payment Method",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primarygreyshade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.green),
                        SizedBox(
                          width: 20,
                        ),
                        Text("FAQs",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.lightBlueAccent),
                        SizedBox(
                          width: 20,
                        ),
                        Text("User Reviews",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.deepPurple),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Settings",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primarygreyshade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.logout, color: primaryColor),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Log Out",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
