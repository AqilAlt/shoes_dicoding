class Sneaker {
  final String name;
  final String brand;
  final double price;
  final String image;
  final bool isAsset;
  final bool isLoved;
  final String description; 

  Sneaker({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    this.isAsset = true,
    this.isLoved = false,
    required this.description, 
  });
}