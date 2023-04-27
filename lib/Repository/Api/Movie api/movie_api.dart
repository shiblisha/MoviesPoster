import 'dart:convert';

import 'package:http/http.dart';

import '../../ModelClass/MovieModel.dart';
import '../api_client.dart';

class MovieApi {
  ApiClient apiClient = ApiClient();

  Future<List<MovieModel>> getMovie() async {
    String trendingpath = 'https://imdb-top-100-movies.p.rapidapi.com/';

    Response response = await apiClient.invokeAPI(trendingpath, 'GET', null);

    return MovieModel.listFromJson(jsonDecode(response.body));
  }
}
