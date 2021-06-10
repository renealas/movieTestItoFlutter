import 'dart:core';
import 'dart:ffi';

import 'package:flutter/material.dart';

class Movie with ChangeNotifier {
  int id;
  String title;
  String posterPath;
  String realeaseDate;
  String overview;
  String average;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.realeaseDate,
    required this.overview,
    required this.average,
  });
}
