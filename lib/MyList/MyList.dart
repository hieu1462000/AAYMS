import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_draw/MyList/Film.dart';

class List extends StatelessWidget{
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
                child: Text("My List",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: 240,),
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
                  Film(imagePath: 'assets/image/Vikings.jpg',),
                  SizedBox(width: 10,),
                  Film(imagePath: 'assets/image/Flash.jpg',),
                  SizedBox(width: 10,),
                  Film(imagePath: 'assets/image/sexedu.jpg',),
                  SizedBox(width: 10,),
                  Film(imagePath: 'assets/image/GFNW.jpg',),
                  SizedBox(width: 10,),
                ],
              )
          ),
        ],
      )
    );
  }

}