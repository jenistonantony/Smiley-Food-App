class Product1Item {
  final String name1;
  final String image1;
  final String restaurant;
  final String price;
  Product1Item({
    required this.name1,
    required this.image1,
    required this.restaurant,
    required this.price,
  });
}

List<Map<String, dynamic>> products1Item = [
  {
    "name1": "Chicken",
    "image1": "assets/images/chicken.png",
    "restaurant": "Rose Restaurant",
    "price": "75"
  },
  {
    "name1": "Hot Dog",
    "image1": "assets/images/hot-dog.png",
    "restaurant": "Golden Restaurant",
    "price": "55"
  },
  {
    "name1": "Burger",
    "image1": "assets/images/burger.png",
    "restaurant": "Alo Restaurant",
    "price": "85"
  },
  {
    "name1": "Samosa",
    "image1": "assets/images/samosa.png",
    "restaurant": "Hub Restaurant",
    "price": "65"
  },
];
