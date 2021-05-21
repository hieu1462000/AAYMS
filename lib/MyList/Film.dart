import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Film extends StatelessWidget{
  final String imagePath;

  const Film({Key key, this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill
          )
      ),
    );
  }
  
}