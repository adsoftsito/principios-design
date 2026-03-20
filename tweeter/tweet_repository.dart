import '../models/tweet.dart';

/// Abstract interface for Twitter repository operations
/// Follows the Dependency Inversion Principle (DIP)
/// Allows for different implementations (HTTP, local cache, mock, etc.)
abstract class ITweetRepository {
  /// Fetch all tweets
  Future<List<Tweet>> fetchTweets();

  /// Create a new tweet
  Future<Tweet> createTweet(String content);

  /// Delete a tweet by ID
  Future<void> deleteTweet(int id);

  /// Cleanup resources
  void dispose();
}
