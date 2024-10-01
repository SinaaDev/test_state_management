class MovieModel {
  final String name;
  final String duration;
  bool isFavorite;

  MovieModel({
    required this.name,
    required this.duration,
    this.isFavorite = false,
  });

  void toggleFavorite(){
    isFavorite = !isFavorite;
  }
}
