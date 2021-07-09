import 'film.dart';

class FilmResponse {
  final List<Film> results;
  final String error;

  FilmResponse(this.results, this.error);

  FilmResponse.fromJson(Map<String, dynamic> json)
    : results = (json["results"] as List).map((i) => new Film.fromJson(i)).toList(),
      error = "";

  FilmResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;

}