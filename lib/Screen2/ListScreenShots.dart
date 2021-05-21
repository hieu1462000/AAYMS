import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ScreenShot.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20,bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Screenshots", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(width: 210,),
                IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {},
                  iconSize: 18,
                  highlightColor: Colors.black,
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
                height: 90,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ScreenShot(imagePath: 'https://www.moviequotesandmore.com/wp-content/uploads/nutcracker.jpg',),
                    SizedBox(width: 10,),
                    ScreenShot(imagePath: 'https://images.static-bluray.com/reviews/18095_1.jpg',),
                    SizedBox(width: 10,),
                    ScreenShot(imagePath: 'https://www.awn.com/sites/default/files/styles/original/public/image/featured/1048395-mpc-creates-enchanting-world-disneys-nutcracker-and-four-realms_0.jpg?itok=_fEsUXX0',),
                    SizedBox(width: 10,),
                    ScreenShot(imagePath: 'https://topsao.vn/wp-content/uploads/2018/10/31/The-Nutcracker-and-the-Four-Realms-teaser-trailer-screenshot.png',),
                    SizedBox(width: 10,),
                  ],
                )
            ),
          ],
        )
    );
  }
}