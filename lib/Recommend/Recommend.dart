import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/Recommend/FilmRecommended.dart';

class ListFilmRecommended extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return CarouselSlider(
       items:[
         FilmRecommended(
           imagePath: 'assets/image/0311_the_nutcracker_and_the_four_realms.jpg',
           filmName: "THE NUTCRACKED AND THE FOUR REALMS",),
         FilmRecommended(
           imagePath: 'assets/image/EndGame.jpg',
           filmName: "END GAME",),
         FilmRecommended(
           imagePath: 'assets/image/fault-in-our-stars-poster-large.jpg',
           filmName: "THE FAULT IN OUR STARS",),
       ],
     options: CarouselOptions(
       height: 150.0,
       enlargeCenterPage: true,
       autoPlay: true,
       aspectRatio: 16 / 9,
       autoPlayCurve: Curves.fastOutSlowIn,
       enableInfiniteScroll: false,
       autoPlayAnimationDuration: Duration(milliseconds: 800),
       viewportFraction: 0.8,
     ),
   );
  }

}