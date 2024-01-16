

import 'package:home_work_movie/model/MovieModel.dart';
import 'package:get/get.dart';

import '../global/HttpService.dart';

class DataController extends GetxController {

  final HttpService httpService = HttpService();

  MovieModel? movieModel;

  Future<bool> getProductList(String list,String language, int page) async {
    try {
      MovieModel info = await httpService.getMovieList(list, language, page);
      movieModel = info;
      update();
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}