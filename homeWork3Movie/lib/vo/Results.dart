
class Results {
  bool? adult;
  String? backdrop_path;
  List<int>? genre_ids;
  int? id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;

  Results(
      {this.adult,
        this.backdrop_path,
        this.genre_ids,
        this.id,
        this.original_language,
        this.original_title,
        this.overview,
        this.popularity,
        this.poster_path,
        this.release_date,
        this.title,
        this.video,
        this.vote_average,
        this.vote_count}
      );

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdrop_path = json['backdrop_path'];
    id = json['id'];
    original_language = json['original_language'];
    original_title = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    poster_path = json['poster_path'];
    release_date = json['release_date'];
    title = json['title'];
    video = json['video'];
    vote_average = json['vote_average'];
    vote_count = json['vote_count'];
  }
}