import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/Library/library.dart';
import 'file:///D:/AndroidStudioProjects/flutter_netflix_draw/lib/now_playing/recommended.dart';
import 'package:flutter_netflix_draw/typical/type.dart';

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
          leading: IconButton(icon: Icon(Icons.menu,color: Colors.white),onPressed: (){
          },
          color: Colors.black,),
          elevation: 0,
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: Image.asset('assets/image/netflix (2).png'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search,color: Colors.white,),
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

class MyBody extends StatefulWidget{
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListView(
        children: [
         ListFilmRecommended(),
          SizedBox(height: 20,),
          Library(),
          SizedBox(height: 20,),
          Type(type: "popular", page: "1",title: "Popular   ",),
          SizedBox(height: 20,),
          Type(type: "top_rated", page: "2",title: "Top Rated",),
          SizedBox(height: 20,),
          Type(type: "upcoming", page: "2",title: "Up coming",),
          //Popular()
        ],
      )
    );
  }
}
