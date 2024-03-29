// ignore_for_file: non_constant_identifier_names, file_names

class ReviewsModel {
  final String ProductId;
  final int ReviewId;
  final String Name;
  final String Review;
  final double Stars;
  final String TimeStamp;

  const ReviewsModel(
      {required this.ReviewId,
      required this.ProductId,
      required this.Name,
      required this.Review,
      required this.Stars,
      required this.TimeStamp});
}
