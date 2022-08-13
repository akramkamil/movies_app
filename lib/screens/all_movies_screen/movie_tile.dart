import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  const MovieTile(this.movie,{Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.image),
      title: Text(movie.title),
      subtitle: Text(movie.description),
    );
  }
}
