import 'package:dio/dio.dart';

import 'film_response.dart';


class FilmApiProvider {


  String _endpoint(String type,String page) {
     return "https://api.themoviedb.org/3/movie/$type?api_key=3d81d8c74f3058471cb07e5459af876b&language=en-US&page=$page";
  }
    final Dio _dio = Dio();


    Future<FilmResponse> getFilm(String type,String page) async {
      try {
        Response response = await _dio.get(_endpoint(type,page));
        return FilmResponse.fromJson(response.data);
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return FilmResponse.withError("$error");
      }
    }
  }

