class Film {
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  Film(this.id, this.originalLanguage, this.originalTitle, this.overview,
      this.posterPath, this.releaseDate, this.voteAverage);

  Film.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        posterPath = 'https://image.tmdb.org/t/p/w500' + json['poster_path'],
        voteAverage = double.parse(json["vote_average"].toString()),
        releaseDate =
            json['release_date'] == null ? "2022-12-31" : json['release_date'];
}

class DetailModel {
  String backdropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  int runtime;
  String tagLine;
  Genres genres;
  String error;

  DetailModel(
      this.backdropPath,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.tagLine,
      this.runtime,
      this.genres);

  DetailModel.fromJson(Map<String, dynamic> json)
      : backdropPath =
            'https://image.tmdb.org/t/p/w500' + json['backdrop_path'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        posterPath = 'https://image.tmdb.org/t/p/w500' + json['poster_path'],
        releaseDate = json['release_date'],
        runtime = int.parse(json['runtime'].toString()),
        tagLine = json['tagline'],
        genres = json['genres'];

  DetailModel.withError(String errorValue) : error = errorValue;
}

class Genres {
  final int id;
  final String name;

  Genres(this.id, this.name);

  Genres.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
