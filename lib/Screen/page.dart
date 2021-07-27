import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_draw/movie_list.dart';

class SecondHome extends StatelessWidget {
  final String type;
  const SecondHome({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp,color: Colors.white),onPressed: (){
          Navigator.pop(context);
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
      body: MyBody(type: type,),
    );
  }
}

class MyBody extends StatelessWidget {
  final String type;
  const MyBody({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children:  <Widget>[
          MovieList(type: type, page: "1",),
          MovieList(type: type, page: "2",),
          MovieList(type: type, page: "3",),
        ]
    );
  }
  
}