class Post {
  final String id;
  final String travellerId;
  Map<String, double>? ratings;
  List<String> imageUrls;

  Post({required this.id, required this.travellerId, this.ratings, required this.imageUrls});
}
