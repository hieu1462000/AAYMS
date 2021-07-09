import 'package:flutter/material.dart';
import 'package:flutter_netflix_draw/Data/film_response.dart';

import 'Data/api_provider.dart';
import 'Data/film.dart';
import 'MyList/task.dart';
import 'condition.dart';

class SecondHome extends StatelessWidget {
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
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  FilmApiProvider _apiProvider = FilmApiProvider();

  Condition condition = Condition();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmResponse>(
      future: _apiProvider.getFilm("popular", "1"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0){
            return condition.buildErrorWidget(snapshot.data.error);
          }
          return _buildFilmWidget(snapshot.data);

        } else if (snapshot.hasError) {
          return condition.buildErrorWidget(snapshot.error);
        } else {
          return condition.buildLoadingWidget();
        }
      },);
  }
  
  Widget _buildFilmWidget(FilmResponse data) {
    List<Film> film = data.results;
    return Container(
      color: Colors.black87,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: film.length,
          itemBuilder: (context, index){
            return Task(imagePath: film[index].posterPath);
      }),
    )
    ;
  }
}
