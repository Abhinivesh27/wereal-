import 'package:flutter/material.dart';
import 'package:wereal/video_page/video.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var thumbNail =
      "https://blog.codemagic.io/uploads/covers/Codemagic-io_Blog_Flutter-Versus-Other-Mobile-Development-Frameworks_1.png";
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
    var listCount = 1;
    var count = 0;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height * 2,
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return VideoCard(
              thumbNail: thumbNail,
              title: title[index],
              channelIcon: channelIcon,
              channelName: channelName,
              videoDuration: videoDuration[index],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: "Videos")
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.thumbNail,
    required this.title,
    required this.channelIcon,
    required this.channelName,
    required this.videoDuration,
  }) : super(key: key);

  final String thumbNail;
  final String title;
  final IconData channelIcon;
  final String channelName;
  final String videoDuration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return VideoPage();
        })));
      }),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Image(
                image: NetworkImage(thumbNail),
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(title),
              leading: Icon(channelIcon),
              subtitle: Text(channelName),
              trailing: Text(videoDuration),
            )
          ],
        ),
      ),
    );
  }
}
