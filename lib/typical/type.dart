import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_draw/Data/api_provider.dart';
import 'package:flutter_netflix_draw/Data/film.dart';
import 'package:flutter_netflix_draw/Data/film_response.dart';
import 'package:flutter_netflix_draw/typical/task.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/data/condition.dart';


import '../Screen/page.dart';

class Type extends StatefulWidget {
  final String type;
  final String page;
  final String title;

  const Type({Key key, this.type, this.page, this.title}) : super(key: key);
  @override
  _TypeState createState() => _TypeState(type, page, title);
}

class _TypeState extends State<Type> {
  final String type;
  final String page;
  final String title;
  FilmApiProvider _apiProvider = FilmApiProvider();
  Condition condition = Condition();

  _TypeState(this.type, this.page, this.title);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmResponse>(
      future: _apiProvider.getFilm(type, page),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return condition.buildErrorWidget(snapshot.data.error);
          }
          return _buildFilmWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return condition.buildErrorWidget(snapshot.error);
        } else {
          return condition.buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildFilmWidget(FilmResponse data) {
    List<Film> film = data.results;
    return Container(
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 220,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => SecondHome(
                              type: type,
                            ));
                    Navigator.push(context, route);
                  },
                  iconSize: 18,
                  highlightColor: Colors.black,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 260,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Task(
                      imagePath: film[index].posterPath,
                      filmName: film[index].originalTitle,
                      movieId: film[index].id,
                      rating: film[index].voteAverage,
                      date: film[index].releaseDate
                    );
                  }),
            ),
          ],
        ));
  }
}
