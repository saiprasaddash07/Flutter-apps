import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';

import '../screen/all_movies_screen.dart';
import '../widget/movies_overview.dart';
import '../providers/movies.dart';
import '../widget/carousel.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _isInit = true;
  var _isLoading = false;

  int i=0;

  @override
  void didChangeDependencies(){
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Movies>(context).fetchAndSetMovies().then((value){
        setState(() {
          i+=1;
          if(i==4){
            _isLoading = false;
          }
        });
      });
      Provider.of<Movies>(context).fetchAndSetEvents().then((value){
        setState(() {
          i+=1;
          if(i==4){
            _isLoading = false;
          }
        });
      });
      Provider.of<Movies>(context).fetchAndSetSports().then((value){
        setState(() {
          i+=1;
          if(i==4){
            _isLoading = false;
          }
        });
      });
      Provider.of<Movies>(context).fetchAndSetPlays().then((value){
        setState(() {
          i+=1;
          if(i==4){
            _isLoading = false;
          }
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final moviesList = Provider.of<Movies>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Tickets',
        ),
      ),
      //backgroundColor: Colors.amber,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Carousel(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Seat Categories',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 115,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      LogoImg(
                        'assets/logos/ic_film.svg',
                        'Movies',
                        AllMoviesScreen.routeName,
                      ),
                      LogoImg(
                        'assets/logos/ic_events.svg',
                        'Events',
                        AllMoviesScreen.routeName,
                      ),
                      LogoImg(
                        'assets/logos/ic_plays.svg',
                        'Plays',
                        AllMoviesScreen.routeName,
                      ),
                      LogoImg(
                        'assets/logos/ic_sports.svg',
                        'Sports',
                        AllMoviesScreen.routeName,
                      ),
                      LogoImg(
                        'assets/logos/ic_activity.svg',
                        'Activity',
                        AllMoviesScreen.routeName,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        'Recommended Seats',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Container(
                          width: 100,
                          margin: EdgeInsets.only(left: 23),
                          child: FlatButton(
                            padding: EdgeInsets.only(right: -105),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AllMoviesScreen.routeName);                             
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 310,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MoviesOverview(
                      moviesList.movies[index].title,
                      moviesList.movies[index].imgUrl,
                      moviesList.movies[index].movieType,
                    ),
                    itemCount: moviesList.movies.length - 4,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Enjoy Events',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MoviesOverview(
                      moviesList.events[index].title,
                      moviesList.events[index].imgUrl,
                      '',
                    ),
                    itemCount: moviesList.movies.length - 4,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Sports',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MoviesOverview(
                      moviesList.sports[index].title,
                      moviesList.sports[index].imgUrl,
                      '',
                    ),
                    itemCount: moviesList.movies.length - 4,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Enjoy Plays',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MoviesOverview(
                      moviesList.plays[index].title,
                      moviesList.plays[index].imgUrl,
                      '',
                    ),
                    itemCount: moviesList.movies.length - 4,
                  ),
                ),
              ],
            ),
    );
  }
}

class LogoImg extends StatelessWidget {
  String logodir;
  String name;
  String routeName;

  LogoImg(
    this.logodir,
    this.name,
    this.routeName,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SvgPicture.asset(
              logodir,
              height: 40,
            ),
            SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
