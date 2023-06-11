import 'package:flutter/material.dart';
import 'package:saloni_heart_foundation/util/listtiles.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  List<String> videos = ['test'];
  List<CustomVideoPlayerController> _controllers = [];
  List<Future<void>> _initializeVideoPlayerFutures = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < videos.length; i++) {
      VideoPlayerController controller = VideoPlayerController.asset('assets/videos/${videos[i]}.mp4');
      _controllers.add(CustomVideoPlayerController(context: context, videoPlayerController: controller));
      _initializeVideoPlayerFutures.add(controller.initialize());
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (var i = 0; i < videos.length; i++) {
      _controllers[i].dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [for (var v in videos) Card(
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        clipBehavior: Clip.antiAlias,
        child: ExpansionTile(
          title: Text(
            v,
            style: const TextStyle(fontSize: 20),
          ),
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          iconColor: Colors.grey.shade600,
          onExpansionChanged: (bool expansion) {
            _controllers[videos.indexOf(v)].videoPlayerController.pause();
          },
          children: [Padding(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder(
              future: _initializeVideoPlayerFutures[videos.indexOf(v)],
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controllers[videos.indexOf(v)].videoPlayerController.value.aspectRatio,
                    child: CustomVideoPlayer(customVideoPlayerController: _controllers[videos.indexOf(v)]),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )],
        ),
      )],
    );
  }
}
