import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../screens/detail.dart';

class MovieBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<Movie>(context);

    var image = movie.posterPath == null
        ? 'https://www.nicepng.com/maxp/u2q8y3u2r5r5t4e6/'
        : 'https://image.tmdb.org/t/p/w200${movie.posterPath}';

    return Container(
      height: 800,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
              onTap: () {
                //print(movie.title);
                Navigator.of(context)
                    .pushNamed(DetailScreen.routeName, arguments: movie);
                //Navigation to detail page.
              },
              child: Image.network(image, fit: BoxFit.cover)),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              movie.title,
              textAlign: TextAlign.center,
            ),
            leading: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Average: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      movie.average,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('Plot: '),
                          Expanded(
                            child: Text(
                              movie.overview,
                              maxLines: null,
                              overflow: TextOverflow.clip,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text('Realease Date: '),
                      Text(movie.realeaseDate),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
