import 'package:flutter/material.dart';
import 'package:temsah/screens/all_vehicles_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:temsah/assets_paths.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoController;
  late AnimationController _playPauseIconController;
  Icon playPauseIcon = Icon(Icons.pause);

  void skip(skipDirection) async {
    var skipDuration = skipDirection * 10;
    _videoController.seekTo(
        (await _videoController.position)! + Duration(seconds: skipDuration));
  }

  void playPause() {
    if (_videoController.value.isPlaying) {
      _videoController.pause();
      _playPauseIconController.forward();
      //playPauseIcon = Icon(Icons.play_arrow);
    } else {
      _videoController.play();
      _playPauseIconController.reverse();
      // playPauseIcon = Icon(Icons.pause);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(intro_video);

    _videoController.addListener(() {
      setState(() {});
    });
    _videoController.setLooping(true);
    _videoController.initialize().then((_) => setState(() {}));
    _videoController.play();
    _videoController.setVolume(0);
    _playPauseIconController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            VideoPlayer(_videoController),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage(mogama3_logo)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LanguageButton(text:'English'),
                            LanguageButton(text:'عربى')
                          ],
                        ),
                      ),

                      Image(image: AssetImage(markabat_logo)),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 90,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              skip(-1);
                            },
                            icon: Icon(
                              Icons.fast_rewind,
                              size: 40,
                            ),
                            color: Colors.white),
                        IconButton(
                            onPressed: playPause,
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.pause_play,
                              progress: _playPauseIconController,
                              size: 40,
                            ),
                            color: Colors.white),
                        IconButton(
                            onPressed: () {
                              skip(1);
                            },
                            icon: Icon(
                              Icons.fast_forward,
                              size: 40,
                            ),
                            color: Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8.0,right:8),
                          child: AutoSizeText(_videoController.value.position.inMinutes
                                  .toString() +
                              ':' +
                              _videoController.value.position.inSeconds.remainder(60)
                                  .toString().padLeft(2,'0'),style: TextStyle(fontSize: 30,color: Colors.white),minFontSize: 15),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 15,
                            child: VideoProgressIndicator(
                              _videoController,
                              allowScrubbing: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0,right:8),
                          child: AutoSizeText(_videoController.value.duration.inMinutes
                                  .toString() +
                              ':' +
                              _videoController.value.duration.inSeconds.remainder(60)
                                  .toString().padLeft(2,'0'),style: TextStyle(fontSize:30,color: Colors.white),minFontSize: 15,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  String text;

  LanguageButton({
    required this.text
  });

@override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AllVehiclesScreen()),
          );
        },
        child: AutoSizeText(
          text,
          style: TextStyle(fontSize: 35),
          minFontSize: 5,

          //style: TextStyle(fontSize: 40),
        ));
  }
}
