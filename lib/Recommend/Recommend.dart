import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/Recommend/FilmRecommended.dart';
import 'package:flutter_netflix_draw/Data/api_provider.dart';
import 'package:flutter_netflix_draw/Data/film.dart';
import 'package:flutter_netflix_draw/Data/film_response.dart';
import 'package:flutter_netflix_draw/condition.dart';

class ListFilmRecommended extends StatefulWidget{
  final String filmName;

  const ListFilmRecommended({Key key, this.filmName}) : super(key: key);

  @override
  _ListFilmRecommendedState createState() => _ListFilmRecommendedState(filmName,"now_playing","1");
}

class _ListFilmRecommendedState extends State<ListFilmRecommended> {
  final String filmName;
  final String type;
  final String page;
  FilmApiProvider _apiProvider = FilmApiProvider();
  Condition _condition = Condition();

  _ListFilmRecommendedState(this.filmName, this.type, this.page);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmResponse>(
      future: _apiProvider.getFilm(type, page),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0){
              return _condition.buildErrorWidget(snapshot.data.error);
            }
            return _buildFilmWidget(snapshot.data);

          } else if (snapshot.hasError) {
            return _condition.buildErrorWidget(snapshot.error);
          } else {
            return _condition.buildLoadingWidget();
          }
      }
    );
  }
  Widget _buildFilmWidget(FilmResponse data) {
    List<Film> film = data.results;
    return CarouselSlider(
      items:[
        FilmRecommended(
          imagePath: film[1].posterPath,
          filmName: film[1].originalTitle,),
        FilmRecommended(
          imagePath: film[2].posterPath,
          filmName: film[2].originalTitle,),
        FilmRecommended(
          imagePath: film[3].posterPath,
          filmName: film[3].originalTitle,),
      ],
      options: CarouselOptions(
        height: 170.0,
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