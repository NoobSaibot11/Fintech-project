import 'dart:convert';
import 'package:http/http.dart' as http;

class YouTubeAPI {
  static const String _baseUrl = 'https://www.googleapis.com/youtube/v3/';
  static const String _apiKey = 'YOUR_YOUTUBE_API_KEY';

  Future<List<dynamic>> fetchVideos(String query) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/search?part=snippet&q=$query&type=video&key=$_apiKey'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return decoded['items'];
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
