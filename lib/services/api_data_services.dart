import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/utils/constants.dart';

class ApiDataServices {
  MoviesModel model = MoviesModel();

  Future<MoviesModel> getMovies(String category) async {
    String url = "https://api.themoviedb.org/3/movie/$category?api_key=${Constants.myApiKey}";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return MoviesModel.fromJson(body);
    } else {
      throw "No Data Found";
    }
  }

  Future<Map<String, dynamic>> movieTrailer(int movieId) async {
    String url = "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=${Constants.myApiKey}";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body;
    } else {
      throw "No Data Found";
    }
  }
}
