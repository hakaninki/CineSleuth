import 'dart:convert';
import 'package:hakanflix/constants.dart';
import 'package:hakanflix/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final _logger = Logger('Api');

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  static const _upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Movie>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Map<String, dynamic>>> getReviews(
      String movieTitleWithoutSpaces, String year) async {
    _logger.fine(
        'getReviews method is running. Movie title without spaces: $movieTitleWithoutSpaces, Year: $year');

    final url = Uri.parse(
        'http://127.0.0.1:5000/getReviews?name=$movieTitleWithoutSpaces&year=$year');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> reviewsJson = json.decode(response.body);
      return reviewsJson.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
