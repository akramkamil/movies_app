class Movie {
  final String id;
  final String title;
  final String description;
  final String image;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Movie.fromJson(Map<String, dynamic> json, String id){
    return Movie(
        id: id,
        title: json['title'],
        description: json['description'],
        image: json['image'],
    );
  }
}
