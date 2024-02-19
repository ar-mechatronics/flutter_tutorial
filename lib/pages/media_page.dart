import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );

    _initializeVideoPlayerFuture = _videoController.initialize();

    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl('asset:assets/canon-in-d-pachelbel-190929.mp3');
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _videoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network('https://picsum.photos/640/480'),
          const SizedBox(height: 16),
          Image.asset('assets/background.webp'),
          const SizedBox(height: 16),
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return GestureDetector(
                  onTap: () {
                    // If the video is playing, pause it.
                    if (_videoController.value.isPlaying) {
                      _videoController.pause();
                    } else {
                      // If the video is paused, play it.
                      _videoController.play();
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_videoController),
                  ),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(0, 64),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              setState(() {
                if (_audioPlayer.playing) {
                  _audioPlayer.stop();
                } else {
                  _audioPlayer.play();
                }
              });
            },
            icon: const Icon(Icons.music_note),
            label: Text(_audioPlayer.playing ? 'Stop music' : 'Play music'),
          )
        ],
      ),
    );
  }
}
