class RestaurantItem {
  final String name;
  final String image;
  RestaurantItem({required this.image, required this.name});
}

List<Map<String, dynamic>> restaurantItem = [
  {
    "names": "Rose Restaurant",
    "images": "assets/images/restaurant1.jpg",
  },
  {
    "names": "Golden Restaurant",
    "images": "assets/images/restaurant2.jpg",
  },
  {
    "names": "Alo Restaurant",
    "images": "assets/images/restaurant3.jpg",
  },
];
