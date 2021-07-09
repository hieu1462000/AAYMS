import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task extends StatelessWidget{
  final String imagePath;
  final String filmName;
  final String date;
  final String rating;
  const Task({Key key, this.imagePath, this.filmName, this.date, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
          return Stack(
            children: [
              Card(
                color: Colors.black26,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Container(
                        width: 130,
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imagePath),
                            fit: BoxFit.cover
                          )
                        ),
                      )
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(left: 8.0, right: 18.0,top: 30),
                      child: Text(
                        filmName,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(left:8.0,bottom: 50,child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Text(rating,style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),),
              ))
            ],
          );
  }
  
}