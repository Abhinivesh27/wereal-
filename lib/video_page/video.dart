import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  var video_url =
      "https://file-examples.com/storage/fe6bd68931628d5b79b8f47/2017/04/file_example_MP4_480_1_5MG.mp4";
  FlickManager flickmanager =
      FlickManager(videoPlayerController: VideoPlayerController.network(""));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flickmanager = FlickManager(
        videoPlayerController: VideoPlayerController.network(video_url));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flickmanager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: FlickVideoPlayer(
                flickManager: flickmanager,
                flickVideoWithControls: FlickVideoWithControls(
                  controls: FlickPortraitControls(),
                ),
                flickVideoWithControlsFullscreen: FlickVideoWithControls(
                  controls: FlickLandscapeControls(),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 8,
              color: Colors.blue,
            ),
            Expanded(
              child: Container(
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
