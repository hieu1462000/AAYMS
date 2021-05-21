import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/Library/Library.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/Recommend/Recommend.dart';
import 'package:flutter_netflix_draw/MyList/MyList.dart';
import 'package:flutter_netflix_draw/MyList/Popular.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu),onPressed: (){
          },
          color: Colors.black,),
          elevation: 0,
          backgroundColor: Colors.white24,
          centerTitle: true,
          title: Image.asset('assets/image/netflix (2).png'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed:(){

                })
          ],
        ),
        body: MyBody(),
      )
    );
  }
}

class MyBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: ListView(
        children: [
         ListFilmRecommended(),
          SizedBox(height: 20,),
          Library(),
          SizedBox(height: 20,),
          List(),
          SizedBox(height: 20,),
          Popular()
        ],
      )
    );
  }


}
