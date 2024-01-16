
import '../vo/Dates.dart';
import '../vo/Results.dart';

class MovieModel {
  Dates? dates;
  int? page;
  List<Results>? results;
  int? total_pages;
  int? total_results;

  MovieModel({this.dates, this.page, this.results, this.total_pages, this.total_results});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['dates'] != null) {
      dates = Dates.fromJson(json['dates']);
    }

    page = json['page'];

    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }

    total_pages = json['total_pages'];
    total_results = json['total_results'];
  }
}