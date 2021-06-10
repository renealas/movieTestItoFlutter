import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';
import '../constants/apikey.dart';

class Movies with ChangeNotifier {
  List<Movie> _items = [];

  List<Movie> get items {
    return [..._items];
  }

  Future<void> fetchQueryMovie(String query) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$key&query=$query');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Movie> loadedMovies = [];
      for (final movie in extractedData['results']) {
        print(movie['poster_path']);
        loadedMovies.add(
          Movie(
            id: movie['id'],
            title: movie['title'].toString(),
            posterPath: movie['poster_path'].toString(),
            overview: movie['overview'].toString(),
            realeaseDate: movie['release_date'].toString(),
            average: movie['vote_average'].toString(),
          ),
        );
      }
      _items = loadedMovies;
      print(loadedMovies);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchAndSetMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$key&language=en-US&page=1');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Movie> loadedMovies = [];
      for (final movie in extractedData['results']) {
        print(movie['vote_average']);
        loadedMovies.add(
          Movie(
            id: movie['id'],
            title: movie['title'],
            posterPath: movie['poster_path'],
            overview: movie['overview'],
            realeaseDate: movie['release_date'],
            average: movie['vote_average'].toString(),
          ),
        );
      }
      _items = loadedMovies;
      print(loadedMovies);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
