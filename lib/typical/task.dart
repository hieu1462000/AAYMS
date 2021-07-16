import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task extends StatelessWidget{
  final String imagePath;
  final String filmName;
  final String date;
  final double rating;
  const Task({Key key, this.imagePath, this.filmName, this.date, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
          return GestureDetector(
            onTap: (){print("ok");},
            child: Stack(
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
                          width: 150,
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imagePath),
                              fit: BoxFit.cover
                            )
                          ),
                        )
                      ),
                      Container(
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 18.0,top:30),
                          child: Text(
                           filmName,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if(date!=null)
                      Container(
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 18.0,top: 4),
                          child: Text(
                            date,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(left:10.0,bottom: 80,child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.redAccent
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('$rating',style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),),
                  )
                ))
              ],
            ),
          );
  }
  
}