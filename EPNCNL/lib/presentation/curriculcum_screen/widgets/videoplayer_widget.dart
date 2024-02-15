import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/curriculcum_screen/widgets/landscape_page.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    Key? key, required this.lessonId,
  }) : super(key: key);

  // required this.videoUrl
  final String lessonId;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  int _currentIndex = 0;
  late Lesson chosenLesson = Lesson();


  @override
  void initState() {
    loadClassModuleByCourseId();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  // void _playVideo({int index = 0, bool init = false}) {
  //   if (index < 0 || index >= 4) return;
  //
  //   if (!init) {
  //     _videoPlayerController.pause();
  //   }
  //
  //   setState(() {
  //     _currentIndex = index;
  //   });
  //
  //   _videoPlayerController.seekTo(Duration.zero);
  //   _videoPlayerController.play();
  // }

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


  Future<void> loadClassModuleByCourseId() async {
    Lesson loadedLesson = await Network.getLessonByLessonId(widget.lessonId);
    setState(() {
      chosenLesson = loadedLesson;
      _videoPlayerController = VideoPlayerController.network(chosenLesson.videoUrl.toString());
      _initializeVideoPlayerFuture =
          _videoPlayerController.initialize().then((_) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            setState(() {});
          });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chosenLesson?.name ?? ''),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              color: Colors.white,
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
                        ),
                      ],
                    )

                  : const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )),
          SingleChildScrollView(
            child: Container(
              // autogroupuf4dMr9 (X1wABu8QvLkeaBNfpvUF4d)
              width: double.infinity,
              height: 300 ,
              child: Stack(
                children: [
                  Center(
                    child: Align(
                      child: SizedBox(
                        width: 338 ,
                        height: 13000 ,
                        child: Html(
                          data: chosenLesson?.reading ?? '',
                          style: {
                            "body": Style(
                              textAlign: TextAlign.center,
                              fontSize: FontSize(20),
                              fontWeight: FontWeight.w400,
                              lineHeight: LineHeight(1.2125),
                              color: Color(0xff6c6363),
                            ),
                          },
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
