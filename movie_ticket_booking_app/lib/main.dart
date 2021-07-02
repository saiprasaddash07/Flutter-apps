import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/providers/movies.dart';
import 'package:movie_ticket_booking_app/screen/movie_detail_screen.dart';
import './screen/all_movies_screen.dart';
import 'package:provider/provider.dart';

import './screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Movies(),
      child: Consumer<Movies>(
        builder: (context, value, child) => MaterialApp(
          title: 'Movie Tickets Book',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            fontFamily: 'Lato',
          ),
          home: MainScreen(),
          routes: {
            AllMoviesScreen.routeName: (context) => AllMoviesScreen(),
            MovieDetailScreen.routeName: (context) => MovieDetailScreen(),
          },
        ),
      ),
    );
  }
}
