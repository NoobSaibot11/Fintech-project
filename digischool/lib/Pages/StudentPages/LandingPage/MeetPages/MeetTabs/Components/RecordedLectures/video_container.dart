import 'package:digischool/APIs/youtube_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class YoutubeVideoContainer extends StatefulWidget {
  const YoutubeVideoContainer({Key? key}) : super(key: key);

  @override
  _YoutubeVideoContainerState createState() => _YoutubeVideoContainerState();
}

class _YoutubeVideoContainerState extends State<YoutubeVideoContainer> {
  final YouTubeAPI _youtubeAPI = YouTubeAPI();
  List<dynamic> _videos = [];

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
  try {
    final videos = await _youtubeAPI.fetchVideos('flutter');
    setState(() {
      _videos = videos;
    });
  } catch (e) {
    Fluttertoast.showToast(
      msg: 'Failed to load videos: $e',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _videos.length,
      itemBuilder: (context, index) {
        final video = _videos[index];
        return ListTile(
          title: Text(video['snippet']['title']),
          subtitle: Text(video['snippet']['description']),
          leading: Image.network(video['snippet']['thumbnails']['default']['url']),
        );
      },
    );
  }
}
