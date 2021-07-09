import 'package:flutter/cupertino.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/Library/LibraryItem.dart';

class Library extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,),
      height: 60,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          LibraryItem(libraryName: "NOW PLAYING",imagePath: 'assets/image/Avengers_Lib.jpg',),
          SizedBox(width: 10,),
          LibraryItem(libraryName: "POPULAR",imagePath: 'assets/image/Avengers_Lib.jpg',),
          SizedBox(width: 10,),
          LibraryItem(libraryName: "TOP RATED",imagePath: 'assets/image/Avengers_Lib.jpg',),
          SizedBox(width: 10,),
          LibraryItem(libraryName: "UP COMING",imagePath: 'assets/image/Avengers_Lib.jpg',),
          SizedBox(width: 10,),

        ],
      ),
    );
  }

}