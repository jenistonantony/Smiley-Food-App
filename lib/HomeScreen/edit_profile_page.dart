import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smiley_foods/Components/color.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final gmailController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();

  File? _image;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.white,
          child: const Text(
            "Edit Profile",
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                      radius: 80,
                      backgroundImage: _image != null
                          ? FileImage(_image!) as ImageProvider
                          : null),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.create,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Full Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: lightGrey, borderRadius: BorderRadius.circular(20)),
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "Enter the name", border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: lightGrey, borderRadius: BorderRadius.circular(20)),
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: gmailController,
                  decoration: const InputDecoration(
                      hintText: "Enter the gmail", border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Phone Number",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: lightGrey, borderRadius: BorderRadius.circular(20)),
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: const InputDecoration(
                      hintText: "Enter the phone number",
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Bio", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: lightGrey, borderRadius: BorderRadius.circular(20)),
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: bioController,
                  decoration: const InputDecoration(
                      hintText: "Enter the bio", border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {},
                    child: const Text(
                      "Save",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
