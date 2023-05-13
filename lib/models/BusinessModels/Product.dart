// ignore_for_file: non_constant_identifier_names

class Product {
  final String BussinessId;
  final String Id;
  final String image;
  final String title;
  final String description;
  final double Price;
  final double rating;
  final int reviews;
  final bool isRecommended;

  const Product({
    required this.BussinessId,
    required this.Id,
    required this.image,
    required this.description,
    required this.title,
    required this.Price,
    required this.rating,
    required this.reviews,
    required this.isRecommended,
  });
}
