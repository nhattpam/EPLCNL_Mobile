import 'package:flutter/material.dart';
import 'package:meowlish/presentation/curriculcum_screen/widgets/landscape_page.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    Key? key,
  }) : super(key: key);

  // required this.videoUrl
  // final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  int _currentIndex = 0;

  @override
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/meowlish-3f184.appspot.com/o/videos%2Fy2mate.com%20-%205%20Second%20Video%20Watch%20the%20Milky%20Way%20Rise_v144P.mp4?alt=media&token=4b5610c4-384f-4fcd-b088-2838c0ae7e3c');
    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= 4) return;

    if (!init) {
      _videoPlayerController.pause();
    }

    setState(() {
      _currentIndex = index;
    });

    _videoPlayerController.seekTo(Duration.zero);
    _videoPlayerController.play();
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              color: Colors.deepPurpleAccent,
              height: 300,
              child: _videoPlayerController.value.isInitialized
                  ? Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 300,
                              child: VideoPlayer(_videoPlayerController),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 30,
                              left: 30,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: IconButton(
                                      icon: Icon(
                                        _videoPlayerController.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_videoPlayerController.value.isPlaying) {
                                            _videoPlayerController.pause();
                                          } else {
                                            _videoPlayerController.play();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  ValueListenableBuilder(
                                      valueListenable: _videoPlayerController,
                                      builder: (context, VideoPlayerValue value,
                                          child) {
                                        return Text(
                                            _videoDuration(value.position),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ));
                                      }),
                                  Expanded(
                                      child: SizedBox(
                                          height: 10,
                                          child: VideoProgressIndicator(
                                            _videoPlayerController,
                                            allowScrubbing: true,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                          ))),
                                  Text(
                                    _videoDuration(
                                        _videoPlayerController.value.duration),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child:
                                      IconButton(
                                        icon: const Icon(
                                          Icons.fullscreen,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        onPressed: () {
                                          if (_videoPlayerController.value.isPlaying) {
                                            _videoPlayerController.pause();
                                          }
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => LandscapePlayerPage(controller: _videoPlayerController)),
                                          ).then((_) {
                                            // Resume video playback when returning from fullscreen
                                            _videoPlayerController.play();
                                          });
                                        },
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )),
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => _playVideo(index: index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'https://afamilycdn.com/150157425591193600/2020/6/23/2-1592892139944338702858.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text('Ju Jing Yi',
                                style: const TextStyle(fontSize: 25)),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
