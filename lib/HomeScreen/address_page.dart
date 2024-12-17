import 'package:flutter/material.dart';
import 'package:smiley_foods/Components/color.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Address",
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: const [
            AddressCard(
              icon: Icons.home_outlined,
              iconColor: Colors.blue,
              title: "HOME",
              address: "2464 Royal Ln. Mesa, New Jersey 45463",
            ),
            SizedBox(height: 20),
            AddressCard(
              icon: Icons.work_outline_rounded,
              iconColor: primaryColor,
              title: "WORK",
              address: "2464 Royal Ln. Mesa, New Jersey 45463",
            ),
          ],
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String address;

  const AddressCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.address,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 50,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle edit action
                      },
                      icon: const Icon(
                        Icons.edit_document,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle delete action
                      },
                      icon: const Icon(
                        Icons.delete_outline_sharp,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                Text(
                  address,
                  style: const TextStyle(
                    color: grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
