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

  // Method to fetch trending movies
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      // Decode the JSON response and convert to a list of Movie objects
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  // Method to fetch top-rated movies
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      // Decode the JSON response and convert to a list of Movie objects
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  // Method to fetch upcoming movies
  Future<List<Movie>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      // Decode the JSON response and convert to a list of Movie objects
      final decodedData =
          json.decode(response.body)['results'] as List<dynamic>;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  // Method to fetch reviews from the backend server
  Future<List<Map<String, dynamic>>> getReviews(
      String movieTitleWithoutSpaces, String year) async {
    // Log the method running state
    _logger.fine(
        'getReviews method is running. Movie title without spaces: $movieTitleWithoutSpaces, Year: $year');

    // Construct the URL for the reviews endpoint
    final url = Uri.parse(
        'http://127.0.0.1:5000/getReviews?name=$movieTitleWithoutSpaces&year=$year');
    // Send the HTTP GET request to the backend server
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // Decode the JSON response and convert to a list of maps
      final List<dynamic> reviewsJson = json.decode(response.body);
      return reviewsJson.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
