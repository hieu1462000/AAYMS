import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/now_playing/movie_recommended.dart';
import 'package:flutter_netflix_draw/Data/api_provider.dart';
import 'package:flutter_netflix_draw/Data/film.dart';
import 'package:flutter_netflix_draw/Data/film_response.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/data/condition.dart';

class ListFilmRecommended extends StatefulWidget{


  const ListFilmRecommended({Key key}) : super(key: key);

  @override
  _ListFilmRecommendedState createState() => _ListFilmRecommendedState("now_playing","1");
}

class _ListFilmRecommendedState extends State<ListFilmRecommended> {
  final String type;
  final String page;
  FilmApiProvider _apiProvider = FilmApiProvider();
  Condition _condition = Condition();

  _ListFilmRecommendedState(this.type, this.page);
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
          ),
        FilmRecommended(
          imagePath: film[2].posterPath,
          ),
        FilmRecommended(
          imagePath: film[3].posterPath,
          ),
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