import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './movie.dart';
import 'dart:convert';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];

  Future<void> addMovies(Movie movie) async {
    final url =
        'https://movie-ticket-booking-app-8bfa8.firebaseio.com/movies.json';
    try {
      await http.post(
        url,
        body: json.encode(
          {
            'title': movie.title,
            'description': movie.description,
            'imageUrl': movie.imgUrl,
            'movieType': movie.movieType,
            'releaseDate' : movie.releaseDate,
            'runningTime': movie.runningTime,
            'movieReleseCat': movie.movieReleseCat,
          },
        ),
      );
    } catch (e) {
      print(e);
      throw new Error();
    }
  }

  List<Movie> get movies {
    return [..._movies];
  }

  Future<void> fetchAndSetMovies() async {
    var url = 'https://movie-ticket-booking-app-8bfa8.firebaseio.com/movies.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<dynamic, dynamic>;
      final List<Movie> loadedMovies = [];
      if(extractedData == null) return;
      extractedData.forEach((movieId, movieData) {
        loadedMovies.add(
          Movie(
            id: movieId,
            title: movieData['title'],
            description: movieData['description'],
            imgUrl: movieData['imageUrl'],
            movieReleseCat: movieData['movieReleseCat'],
            movieType: movieData['movieType'],
            releaseDate: movieData['releaseDate'],
            runningTime: movieData['runningTime'],
          ),
        );
      });
      _movies = loadedMovies;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Movie> nowShowing() {
    List<Movie> res = _movies.where((e) {
      return e.movieReleseCat.contains('Now Showing');
    }).toList();
    return res;
  }

  List<Movie> comingSoon() {
    List<Movie> res = _movies.where((e) {
      return e.movieReleseCat.contains('Coming Soon');
    }).toList();
    return res;
  }

  List<Movie> exclusive() {
    List<Movie> res = _movies.where((e) {
      return e.movieReleseCat.contains('Exclusive');
    }).toList();
    return res;
  }

  List<Event> _events = [];

  Future<void> addEvents(Event event) async {
    final url =
        'https://movie-ticket-booking-app-8bfa8.firebaseio.com/events.json';
    try {
      await http.post(
        url,
        body: json.encode(
          {
            'title': event.title,
            'description': event.description,
            'imageUrl': event.imgUrl,
          },
        ),
      );
    } catch (e) {
      print(e);
      throw new Error();
    }
  }

  Future<void> fetchAndSetEvents() async {
    var url = 'https://movie-ticket-booking-app-8bfa8.firebaseio.com/events.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Event> loadedEvents = [];
      if(extractedData == null) return;
      extractedData.forEach((eventId, eventData) {
        loadedEvents.add(
          Event(
            id: eventId,
            title: eventData['title'],
            description: eventData['description'],
            imgUrl: eventData['imageUrl'],
          ),
        );
      });
      _events = loadedEvents;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Event> get events {
    return [..._events];
  }

  List<Sport> _sports = [];

  Future<void> addSports(Sport sport) async {
    final url =
        'https://movie-ticket-booking-app-8bfa8.firebaseio.com/sports.json';
    try {
      await http.post(
        url,
        body: json.encode(
          {
            'title': sport.title,
            'imageUrl': sport.imgUrl,
          },
        ),
      );
    } catch (e) {
      print(e);
      throw new Error();
    }
  }

  Future<void> fetchAndSetSports() async {
    var url = 'https://movie-ticket-booking-app-8bfa8.firebaseio.com/sports.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Sport> loadedSports = [];
      if(extractedData == null) return;
      extractedData.forEach((sportId, sportData) {
        loadedSports.add(
          Sport(
            id: sportId,
            title: sportData['title'],
            imgUrl: sportData['imageUrl'],
          ),
        );
      });
      _sports = loadedSports;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Sport> get sports {
    return [..._sports];
  }

  List<Play> _plays = [];

  Future<void> addPlays(Play play) async {
    final url =
        'https://movie-ticket-booking-app-8bfa8.firebaseio.com/plays.json';
    try {
      await http.post(
        url,
        body: json.encode(
          {
            'title': play.title,
            'imageUrl': play.imgUrl,
          },
        ),
      );
    } catch (e) {
      print(e);
      throw new Error();
    }
  }

  Future<void> fetchAndSetPlays() async {
    var url = 'https://movie-ticket-booking-app-8bfa8.firebaseio.com/plays.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Play> loadedPlays = [];
      if(extractedData == null) return;
      extractedData.forEach((playId, playData) {
        loadedPlays.add(
          Play(
            id: playId,
            title: playData['title'],
            imgUrl: playData['imageUrl'],
          ),
        );
      });
      _plays = loadedPlays;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Play> get plays {
    return [..._plays];
  }
}
