// ignore_for_file: empty_constructor_bodies

class Additems {
  int quality;
  String name;
  String price;
  String details;
  String image;

  Additems({
    this.quality = 1,
    required this.name,
    required this.price,
    required this.details,
    required this.image,
  });
}
