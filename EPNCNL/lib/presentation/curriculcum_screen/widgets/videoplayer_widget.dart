import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/network/network.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    Key? key,
    required this.lessonId,
    required this.videoUrl,
  }) : super(key: key);

  final String lessonId;
  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Lesson chosenLesson = Lesson();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    _loadClassModuleByCourseId();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    await _videoPlayerController.initialize();
    setState(() {
      _chewieController = ChewieController(
        allowFullScreen: true,
        videoPlayerController: _videoPlayerController,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        autoPlay: true,
        looping: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(errorMessage),
          );
        },
        placeholder: Center(
          child: CircularProgressIndicator(),
        ),
      );
      _isLoading = false;
    });
  }

  Future<void> _loadClassModuleByCourseId() async {
    Lesson loadedLesson = await Network.getLessonByLessonId(widget.lessonId);
    setState(() {
      chosenLesson = loadedLesson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chosenLesson.name.toString()),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: _chewieController),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Html(
                      data: chosenLesson.reading ?? '',
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
                ],
              ),
            ),
    );
  }
}
