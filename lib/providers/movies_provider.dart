import 'package:flutter/material.dart';
import 'package:movies_app/services/movies_services.dart';
import '../models/movie.dart';

class MoviesProvider with ChangeNotifier {
  List<Movie> movies = [];
  final MoviesServices _ms= MoviesServices();

  void addMovies(String title, String desc, String imageUrl) async {
    await _ms.addMovie(title, desc, imageUrl);
  }
  Future <void> getAllMovies () async {
    movies = await _ms.getAllMovies();
  }
}