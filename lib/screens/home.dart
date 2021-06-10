import 'package:flutter/material.dart';
import 'package:itomovieapp/providers/auth.dart';
import 'package:itomovieapp/providers/movies.dart';
import 'package:itomovieapp/widgets/movie_grid.dart';
import 'package:provider/provider.dart';

import '../screens/auth.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchMovieEditingController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Movies>(context, listen: false).fetchAndSetMovies();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies ITO'),
        actions: [
          GestureDetector(
            onTap: () {
              //Provider.of<Auth>(context).logout();
              Navigator.of(context).popAndPushNamed(AuthScreen.routeName);
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black87,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchMovieEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Movie",
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (searchMovieEditingController.text != '') {
                            Provider.of<Movies>(context, listen: false)
                                .fetchQueryMovie(
                                    searchMovieEditingController.text);
                          }
                        },
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: MoviesGrid(),
          ),
        ],
      ),
    );
  }
}
