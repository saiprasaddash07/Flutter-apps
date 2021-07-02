import 'package:flutter/foundation.dart';

class Movie with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final String movieType;
  final String releaseDate;
  final String runningTime;
  final bool nowShowing;
  final bool comingSoon;
  final bool exclusive;
  bool percentageLiked;
  bool isFavorite;

  Movie({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imgUrl,
    @required this.movieType,
    @required this.releaseDate,
    @required this.runningTime,
    @required this.comingSoon,
    @required this.nowShowing,
    @required this.exclusive,
    this.percentageLiked,
    this.isFavorite,
  });
}

class Event with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imgUrl;
  bool isFavorite;

  Event({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imgUrl,
    this.isFavorite,
  });
}

class Sport with ChangeNotifier {
  final String id;
  final String title;
  final String imgUrl;
  bool isFavorite;

  Sport({
    @required this.id,
    @required this.title,
    @required this.imgUrl,
    this.isFavorite,
  });
}

class Play with ChangeNotifier {
  final String id;
  final String title;
  final String imgUrl;
  bool isFavorite;

  Play({
    @required this.id,
    @required this.title,
    @required this.imgUrl,
    this.isFavorite,
  });
}
