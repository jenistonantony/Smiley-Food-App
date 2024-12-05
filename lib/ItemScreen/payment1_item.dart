class Payment1Item {
  final String paymentname;
  final String paymentimage;

  Payment1Item({
    required this.paymentname,
    required this.paymentimage,
  });
}

List<Map<String, dynamic>> payment1item = [
  {
    "paymentname": "Cash",
    "paymentimage": "assets/images/cash-on-delivery.png",
  },
  {
    "paymentname": "Rupay",
    "paymentimage": "assets/images/rupay.png",
  },
  {
    "paymentname": "Master card",
    "paymentimage": "assets/images/mastercard.png",
  },
  {
    "paymentname": "Visa",
    "paymentimage": "assets/images/visa.png",
  },
  {
    "paymentname": "DebitCard",
    "paymentimage": "assets/images/debitcard.png",
  }
];
