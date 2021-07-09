import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_draw/Screen2/Screen2.dart';

class FilmRecommended extends StatelessWidget{
  final String imagePath;
  final String filmName;

  const FilmRecommended( {Key key, this.imagePath, this.filmName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: () {

     },
     child: Container(
         decoration: BoxDecoration(
             // boxShadow: [
             //   BoxShadow(
             //     color: Colors.black,
             //     blurRadius:20.0, // has the effect of softening the shadow
             //     spreadRadius: 1.0, // has the effect of extending the shadow
             //     offset: Offset(
             //       0, // horizontal, move right 10
             //       10.0, // vertical, move down 10
             //     ),
             //   )
             // ],
             borderRadius: BorderRadius.circular(10),
             image: DecorationImage(
                 image: NetworkImage(imagePath),
                 fit: BoxFit.cover
             )
         ),
         child: Column(
           children: [
             SizedBox(
               height: 120,
             ),
             Align(
               alignment: Alignment.bottomLeft,
               child: Text(
                 filmName,
                 textAlign: TextAlign.start,
                 style: TextStyle(
                     fontSize: 20,
                     color: Colors.white70,
                     fontWeight: FontWeight.bold
                 ),),
             ),
           ],
         )
     ),
   );
  }

}