import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_draw/page.dart';

class LibraryItem extends StatelessWidget{
  final String imagePath;
  final String libraryName;
  final String type;


  const LibraryItem( {Key key, this.imagePath, this.libraryName, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Route route = MaterialPageRoute(builder: (context) => SecondHome(type: type,));
        Navigator.push(context, route);
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage(imagePath),
                fit: BoxFit.cover
            )
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(libraryName,
            style: TextStyle(
              color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),),
        ),

      ),
    );
  }
  
}