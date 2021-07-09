class Film {
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String voteAverage;

  Film(this.id, this.originalLanguage, this.originalTitle, this.overview, this.posterPath, this.releaseDate, this.voteAverage);

  Film.fromJson(Map<String, dynamic> json)
      : id =  json['id'],
        originalLanguage =  json['original_language'],
        originalTitle =  json['original_title'],
        overview = json['overview'],
        posterPath = 'https://image.tmdb.org/t/p/w500'+json['poster_path'],
        voteAverage = json['vote_average'],
        releaseDate = json['release_date'];

}