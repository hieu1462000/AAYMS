import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Film.dart';

class Popular extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20,),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Popular on Netflix",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(width: 170,),
                IconButton(icon: Icon(Icons.arrow_forward), onPressed:(){},
                  iconSize: 18,
                  highlightColor: Colors.black,
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Film(imagePath: 'assets/image/daredevil.jpg',),
                    SizedBox(width: 10,),
                    Film(imagePath: 'assets/image/Orange.jpg',),
                    SizedBox(width: 10,),
                    Film(imagePath: 'assets/image/Luke.jpeg',),
                    SizedBox(width: 10,),
                  ],
                )
            ),
          ],
        )
    );
  }
}