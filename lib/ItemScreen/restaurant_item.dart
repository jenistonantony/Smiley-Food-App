class RestaurantItem {
  final String? name;
  final String? image;
  RestaurantItem({this.image, this.name});
}

List<Map<String, dynamic>> restaurantItem = [
  {
    "names": "Rose Restaurant ",
    "images": "assets/images/restaurant1.jpg",
    "foodimages": "assets/images/food1.jpg",
  },
  {
    "names": "Golden Restaurant",
    "images": "assets/images/restaurant2.jpg",
    "foodimages": "assets/images/food2.jpg",
  },
  {
    "names": "Alo Restaurant Hub",
    "images": "assets/images/restaurant3.jpg",
    "foodimages": "assets/images/food3.jpg",
  },
  // {
  //   "names": "Hub Restaurant",
  //   "images": "assets/images/restaurant3.jpg",
  // },
];
