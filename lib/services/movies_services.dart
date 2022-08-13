import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie.dart';

class MoviesServices with ChangeNotifier {
  Future<void> addMovie (String title, String desc, String imageUrl) async {
    var res = await http.post(Uri.parse(
        'https://movies-app-13096-default-rtdb.firebaseio.com/movies.json'),
        body: json.encode({
          'title': title,
          'description': desc,
          'image': imageUrl
        })
    );
  }
    Future<List<Movie>> getAllMovies() async{
      List<Movie> movies= [];
      var res = await http.get(Uri.parse('https://movies-app-13096-default-rtdb.firebaseio.com/movies.json'),);
      var allMoviesJson= json.decode(res.body) as Map<String, dynamic>;
      for(var x in allMoviesJson.keys){
        movies.add(Movie.fromJson(allMoviesJson[x], x));
      }
      return movies;
    }
  }
