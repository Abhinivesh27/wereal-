import 'dart:convert';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wereal/home/body.dart';

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

  var title = [
    "Home made video on flutter",
    "Flutter tips and tricks",
    "Appdev made easy 2022",
    "Flutter dev made easy on this year"
  ];
  var channelName = "Flutter dev";
  var channelIcon = Icons.person;
  var videoDuration = ["27:00", "23:00", "10:00", "20:00"];
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
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.thumb_up),
                  Icon(Icons.thumb_down),
                  Icon(Icons.share),
                  Icon(Icons.download),
                  Icon(Icons.save),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                itemCount: 3,
                itemBuilder: (Context, index) {
                  return VideoCard(
                    thumbNail:
                        "https://blog.codemagic.io/uploads/covers/Codemagic-io_Blog_Flutter-Versus-Other-Mobile-Development-Frameworks_1.png",
                    title: title[index],
                    channelIcon: Icons.person,
                    channelName: "Nila",
                    videoDuration: "2:30",
                  );
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}
