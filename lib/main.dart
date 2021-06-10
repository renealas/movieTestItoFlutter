import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Screens
import './screens/home.dart';
import './screens/detail.dart';
import './screens/auth.dart';

//Providers
import './providers/movies.dart';
import './providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Movies(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: AuthScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          DetailScreen.routeName: (ctx) => DetailScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
        },
      ),
    );
  }
}
