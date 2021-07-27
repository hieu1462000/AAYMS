import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_draw/data/api_provider.dart';
import 'package:flutter_netflix_draw/data/film.dart';
import 'package:intl/intl.dart';

import '../data/condition.dart';

class MovieDetail extends StatefulWidget {
  final int movieId;
  const MovieDetail({Key key, this.movieId}) : super(key: key);
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  DetailApiProvider _apiProvider = DetailApiProvider();
  Condition condition = Condition();
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailModel>(
      future: _apiProvider.getDetail(widget.movieId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return condition.buildErrorWidget(snapshot.data.error);
          }
          return _buildDetailWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return condition.buildErrorWidget(snapshot.error);
        } else {
          return condition.buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildDetailWidget(DetailModel data) {
    var dateTime = DateFormat('yyyy-MM-dd');
    DetailModel detailResponse = data;
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: ListView(
          children: [
            Stack(overflow: Overflow.visible, children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                  child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.7),
                                BlendMode.dstATop),
                            image: NetworkImage(detailResponse.backdropPath),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                  left: 10,
                  child: Container(
                    child: Row(children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_sharp)),
                      SizedBox(
                        width: 115,
                      ),
                      Container(
                        child: Image.asset('assets/image/netflix (2).png'),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _value = !_value;
                          });
                        },
                        child: _value
                            ? Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                      ),
                    ]),
                  )),
              Positioned(
                  top: 240,
                  left: 140,
                  child:
                      Container(child: Image.asset('assets/image/play4.png')))
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 280,
                  ),
                  Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Align(
              //alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(left: 60, right: 60),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        detailResponse.originalTitle,
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        detailResponse.tagLine,
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Year",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.y()
                            .format(dateTime.parse(detailResponse.releaseDate)),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Country",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "USA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Length",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "119 min",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                detailResponse.overview,
                style: TextStyle(color: Colors.white),
                maxLines: null,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
