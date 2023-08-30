import "dart:convert";
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../class_model/movie.dart';

class NetworkRequest {
  static const String url = 'https://api.themoviedb.org/3/movie/popular';

  static List<Results> parseMovie(String responseBody) {
    Map<String, dynamic> jsonData = jsonDecode(responseBody);
    List<dynamic> movieList = jsonData['results'];
    List<Results> movies =
        movieList.map((model) => Results.fromJson(model)).toList();
    return movies;
  }

  static Future<List<Results>> fetchMovies() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMjlkZDUwYmMzM2M0ZGY3OWFiZTI3YjFlYWE4N2VlZCIsInN1YiI6IjY0MmUzNmU0MmRjNDRlMDEyNzExZDA3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.w3nG2QqaveTBg7c_iDy-Iug5ALeRnnABBTJOMS9_GTw', // Replace with your API key
    };

    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/top_rated'),
        headers: headers);
    if (response.statusCode == 200) {
      return compute(parseMovie, response.body);
    } else {
      throw Exception("Can't get movies");
    }
  }
}
