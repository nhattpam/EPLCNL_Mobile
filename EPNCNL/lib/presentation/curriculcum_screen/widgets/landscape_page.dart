import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class LandscapePlayerPage extends StatefulWidget {
  const LandscapePlayerPage({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  _LandscapePlayerPageState createState() => _LandscapePlayerPageState();
}

class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
  @override
  void initState() {
    super.initState();
    setLandscape();
  }

  @override
  void dispose() {
    setAllOrientations();
    super.dispose();
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  Widget build(BuildContext context) => VideoPlayer(widget.controller);
}
