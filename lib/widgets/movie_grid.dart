import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies.dart';
import './movie_box.dart';

class MoviesGrid extends StatefulWidget {
  @override
  _MoviesGridState createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<Movies>(context);
    final movies = movieData.items;

    return ListView.builder(
        padding: const EdgeInsets.all(9.0),
        itemCount: movies.length,
        itemExtent: 300,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: movies[i],
              child: MovieBox(),
            ));
  }
}
