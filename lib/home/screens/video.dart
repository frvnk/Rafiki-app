import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Understanding Anxiety',
      'id': 'https://www.youtube.com/watch?v=A9wwZmBGKiU&pp=ygUVVW5kZXJzdGFuZGluZyBBbnhpZXR5',
    },
    {
      'title': 'Coping with Depression',
      'id': 'https://www.youtube.com/watch?v=8Su5VtKeXU8&pp=ygUWY29waW5nIHdpdGggZGVwcmVzc2lvbg%3D%3D',
    },
    {
      'title': 'Stress Management Tips',
      'id': 'https://www.youtube.com/watch?v=i-pazYyLSWQ&pp=ygUWU3RyZXNzIE1hbmFnZW1lbnQgVGlwcw%3D%3D',
    },{
      'title': 'Self Therapy Tips',
      'id': 'https://www.youtube.com/watch?v=3bNHkg4ZPpA&pp=ygUMc2VsZiB0aGVyYXB5',
    },{
      'title': 'Sign of self harm',
      'id': 'https://www.youtube.com/watch?v=8Eje1lavfqE&pp=ygUJc2VsZiBoYXJt',
    },{
      'title': 'Importance of Counselling',
      'id': 'https://www.youtube.com/watch?v=RVtVG4YgZ10&pp=ygUZaW1wb3J0YW5jZSBvZiBjb3Vuc2VsbGluZw%3D%3D',
    },
  ];

  VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Videos'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.video_library, color: Colors.deepPurple[300]),
            title: Text(videos[index]['title']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoId: videos[index]['id']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}




class VideoPlayerScreen extends StatefulWidget {
  final String videoId;

  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.deepPurple[300],
      ),
    );
  }
}
