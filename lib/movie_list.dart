import 'package:flutter/material.dart';
import 'package:flutter_netflix_draw/Data/film_response.dart';
import 'package:intl/intl.dart';

import 'Data/api_provider.dart';
import 'Data/film.dart';
import 'typical/task.dart';
import 'data/condition.dart';

class MovieList extends StatefulWidget {
  final String type;
  final String page;

  const MovieList({Key key, this.type, this.page}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  FilmApiProvider _apiProvider = FilmApiProvider();

  Condition condition = Condition();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmResponse>(
      future: _apiProvider.getFilm(widget.type, widget.page),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0){
            return condition.buildErrorWidget(snapshot.data.error);
          }
          return _buildFilmWidget(snapshot.data);

        } else if (snapshot.hasError) {
          return condition.buildErrorWidget(snapshot.error);
        } else {
          return condition.buildLoadingWidget();
        }
      },);
  }
  
  Widget _buildFilmWidget(FilmResponse data) {
    var dateTime = DateFormat('yyyy-MM-dd');
    List<Film> film = data.results;
    return Container(
      padding: EdgeInsets.only(left: 15),
      color: Colors.black87,
      child: GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
              crossAxisCount: 2,
            childAspectRatio: 1/1.5
          ),
          itemCount: film.length,
          itemBuilder: (context, index){
            return Task(
                imagePath: film[index].posterPath,
                filmName: film[index].originalTitle,
                rating: film[index].voteAverage,
              date: DateFormat.yMMMMd('en_US')
                  .format(dateTime.parse(film[index].releaseDate)),);
      }),
    );
  }
}
