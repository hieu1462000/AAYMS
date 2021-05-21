import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenShot extends StatelessWidget{
  final String imagePath;
  const ScreenShot( {Key key, this.imagePath,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.fill
          )
      ),
    );
  }

}