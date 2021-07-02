import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/image2.jpg',
  'assets/images/image3.png',
  'assets/images/image1.jpg',
  'assets/images/image6.jpg',
];

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: imgList
          .map((item) => Container(
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                ),
              ))
          .toList(),
    ));
  }
}
