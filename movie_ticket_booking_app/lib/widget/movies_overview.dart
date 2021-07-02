import 'package:flutter/material.dart';

class MoviesOverview extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String movieType;

  MoviesOverview(this.title, this.imgUrl, this.movieType);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 269,
      width: 150,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.network(
            imgUrl,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Text(
            movieType,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
