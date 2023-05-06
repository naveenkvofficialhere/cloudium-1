import 'dart:convert';
import 'dart:developer';

import 'package:cloudium_new/model/most_popular_model.dart';
import 'package:dio/dio.dart';

class NyServices {
  static var dio = Dio();

  static Future<MostPopularModel?> getMostPopularNyTimes() async {
    try {
      Response response = await dio.get(
          'https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=cQ9rISjDmlKUm2EsG5FHzHGzqPdMniDw');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return mostPopularModelFromJson(jsonEncode(response.data));
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
