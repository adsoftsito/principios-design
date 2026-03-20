import 'tweet.dart';

/// Model for the paginated response from the tweets API endpoint
class TweetResponse {
  final List<Tweet> content;

  TweetResponse({
    required this.content,
  });

  /// Convert JSON to TweetResponse object
  factory TweetResponse.fromJson(Map<String, dynamic> json) {
    final contentList = json['content'] as List<dynamic>? ?? [];
    return TweetResponse(
      content: contentList
          .map((tweet) => Tweet.fromJson(tweet as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() =>
      'TweetResponse(content: ${content.length}, totalElements)';
}
