import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/screen/movie_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/movies.dart';
import '../providers/movie.dart';
import '../screen/movie_detail_screen.dart';

class AllMoviesScreen extends StatelessWidget {
  static const routeName = '/all-movies';

  @override
  Widget build(BuildContext context) {
    final moviesItem = Provider.of<Movies>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Movies in Cuttack',
              style: TextStyle(fontSize: 24),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 29,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.sort,
                  size: 29,
                ),
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              //labelColor: Colors.pink,
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    'Now showing',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    'Coming Soon',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    'Exclusive',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MovieTypeScreen(moviesItem.nowShowing()),
              MovieTypeScreen(moviesItem.comingSoon()),
              MovieTypeScreen(moviesItem.exclusive()),
            ],
          )),
    );
  }
}

class MovieTypeScreen extends StatelessWidget {
  MovieTypeScreen(
    @required this.allMovie,
  );

  final List<Movie> allMovie;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) => Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(MovieDetailScreen.routeName);
            },
                      child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                allMovie[index].imgUrl,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            allMovie[index].title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          Text(
            allMovie[index].releaseDate,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      itemCount: allMovie.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1 / 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 10,
      ),
    );
  }
}
