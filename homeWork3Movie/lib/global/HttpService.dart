
import 'dart:convert';

import 'package:home_work_movie/model/MovieModel.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<MovieModel> getMovieList(String list,String language, int page) async {
    Map<String, String> headers = {
      "accept": 'application/json',
      "Authorization": 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYmFjZTM0NjU4ZDc0ZWVhZjExZDE5N2U5NjI3NmM5MSIsInN1YiI6IjY1YTBkNmM0ZjA0ZDAxMDEzMTc5MDU5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.92h7Sy6FIwe6YKMFx_QaoBhNXyHrSLK2rzZ4jVaulPY'
    };

    String url = "https://api.themoviedb.org/3/movie/${list}?language=${language}&page=${page}";

    Uri uri = Uri.parse(url);

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("server_fail");
    }
  }
}
