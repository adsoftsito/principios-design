import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/tweet.dart';
import '../models/tweet_response.dart';
import '../repositories/tweet_repository.dart';

/// Singleton service implementing the Repository Pattern
/// Implements: Singleton Pattern + Repository Pattern + Error Handling
/// Follows SOLID principles: Single Responsibility, Dependency Inversion
class TweetService implements ITweetRepository {
  static final TweetService _instance = TweetService._internal();

  //final String baseUrl = 'https://adsoftsito-api.render.com/api';
  final String baseUrl = 'http://localhost:8080/api';
  late http.Client _httpClient;

  // Private constructor
  TweetService._internal() {
    _httpClient = http.Client();
  }

  /// Factory constructor that always returns the same instance
  factory TweetService() {
    return _instance;
  }

  /// Get the singleton instance
  static TweetService getInstance() {
    return _instance;
  }

  @override
  Future<List<Tweet>> fetchTweets() async {
    try {
      final response = await _httpClient.get(
        Uri.parse('$baseUrl/tweets'),
      );

      if (response.statusCode == 200) {
        return _parseGetTweetsResponse(response.body);
      } else {
        throw Exception(
          'Failed to load tweets. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching tweets: $e');
    }
  }

  @override
  Future<Tweet> createTweet(String content) async {
    try {
      if (content.isEmpty) {
        throw Exception('Tweet content cannot be empty');
      }

      final response = await _httpClient.post(
        Uri.parse('$baseUrl/tweets'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'tweet': content}),
      );

      if (response.statusCode == 200) {
        return _parseTweetResponse(response.body);
      } else {
        throw Exception(
          'Failed to create tweet. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error creating tweet: $e');
    }
  }

  @override
  Future<void> deleteTweet(int id) async {
    try {
      final response = await _httpClient.delete(
        Uri.parse('$baseUrl/tweets/$id'),
      );

      if (response.statusCode != 204 && response.statusCode != 200) {
        throw Exception(
          'Failed to delete tweet. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error deleting tweet: $e');
    }
  }

  /// Parse GET tweets response - Single Responsibility
  List<Tweet> _parseGetTweetsResponse(String responseBody) {
    final jsonData = jsonDecode(responseBody) as Map<String, dynamic>;
    final tweetResponse = TweetResponse.fromJson(jsonData);
    return tweetResponse.content;
  }

  /// Parse single tweet response - Single Responsibility
  Tweet _parseTweetResponse(String responseBody) {
    final jsonData = jsonDecode(responseBody) as Map<String, dynamic>;
    return Tweet.fromJson(jsonData);
  }

  /// Close the HTTP client (cleanup)
  @override
  void dispose() {
    _httpClient.close();
  }
}
