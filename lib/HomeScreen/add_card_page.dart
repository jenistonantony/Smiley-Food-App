import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smiley_foods/Components/color.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Add Card",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: "CARD HOLDER NAME",
                    hintText: "Enter the holder name",
                    controller: nameController,
                    inputType: TextInputType.name,
                  ),
                  const SizedBox(height: 30),
                  _buildInputField(
                    label: "CARD NUMBER",
                    hintText: "---- ---- ---- ----",
                    controller: cardNumberController,
                    inputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardNumberInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInputField(
                          label: "EXPIRE DATE",
                          hintText: "mm/yyyy",
                          controller: expireDateController,
                          inputType: TextInputType.datetime,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildInputField(
                          label: "CVC",
                          hintText: "***",
                          controller: cvcController,
                          inputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/CongratulationPage');
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "ADD & MAKE PAYMENT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required TextInputType inputType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: grey,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: controller,
              keyboardType: inputType,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(text[i]);
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
