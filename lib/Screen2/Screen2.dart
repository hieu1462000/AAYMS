import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CurvedBottom.dart';
import 'ListScreenShots.dart';
import 'StarIcon.dart';

class Film extends StatefulWidget {
  @override
  _FilmState createState() => _FilmState();
}

class _FilmState extends State<Film> {
  double rating = 1.5;
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
                height: 280,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop),
                        image: NetworkImage(
                            'https://static.wikia.nocookie.net/disney/images/6/60/The_Nutcracker_and_the_Four_Realms_official_poster.jpg/revision/latest?cb=20180628171840'),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Icon(Icons.arrow_back_sharp))),
                      SizedBox(width: 110),
                      Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset('lib/image/netflix.png'),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Icon(
                              Icons.play_circle_fill_rounded,
                              color: Colors.white30,
                              size: 70,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
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
                          )),
                    ],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  size: 30,
                ),
                SizedBox(
                  width: 270,
                ),
                Icon(Icons.share_outlined)
              ],
            ),
          ),
          Align(
            //alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(left: 70, right: 60),
              child: Column(
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      "THE NUTCRACKER AND THE FOUR REALMS",
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Adventure, Family, Fantasy",
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StarRating(
                        rating: rating,
                        onRatingChanged: (rating) =>
                            setState(() => this.rating = rating),
                      )
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
            margin: EdgeInsets.only(left: 50, right: 25),
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
                      "2018",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontWeight: FontWeight.bold),
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
              "mot hai ba bon nam sau bay tam chin muoi mot hai ba bon nam sau bay tam chin muoi hai ba bon nam sau bay tam chin muoi",
              maxLines: null,
              textAlign: TextAlign.justify,
            ),
          ),
          ListScreen()
        ],
      ),
    );
  }
}
