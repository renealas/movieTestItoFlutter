import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../models/movie.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              movie.title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                movie.overview,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Realese Date: ${movie.realeaseDate}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Average:',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SmoothStarRating(
              allowHalfRating: false,
              starCount: 5,
              rating: double.parse(movie.average),
              color: Colors.yellow,
              isReadOnly: true,
            )
          ],
        ),
      ),
    );
  }
}
