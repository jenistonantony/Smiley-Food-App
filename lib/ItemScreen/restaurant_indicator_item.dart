class RestaurantIndicatorItem {
  final List<ImageModel> images = [
    ImageModel(image: 'assets/images/food1.jpg'),
    ImageModel(image: 'assets/images/food2.jpg'),
    ImageModel(image: 'assets/images/food3.jpg'),
    ImageModel(image: 'assets/images/food4.jpg'),
    ImageModel(image: 'assets/images/food5.jpg'),
  ];
}

class ImageModel {
  final String image;
  ImageModel({required this.image});
}
