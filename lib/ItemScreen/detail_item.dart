class DetailItem {
  final List<ImageModel> images = [
    ImageModel(image: 'assets/images/pepper.png'),
    ImageModel(image: 'assets/images/chicken-leg.png'),
    ImageModel(image: 'assets/images/chili-pepper.png'),
    ImageModel(image: 'assets/images/garlic.png'),
    ImageModel(image: 'assets/images/onion.png'),
  ];
}

class ImageModel {
  final String image;
  ImageModel({required this.image});
}
