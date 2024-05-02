import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/materials.dart';
import 'package:meowlish/network/network.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import '../../single_course_meet_details_curriculcum_page/single_course_meet_details_curriculcum_page.dart';

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

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with TickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Lesson chosenLesson = Lesson();
  bool _isLoading = true;
  bool _isLoadingVideo = true;
  late TabController _tabController;
  late List<Materials> listMaterial = [];

  @override
  void initState() {
    print("This is lesson Id" + widget.lessonId);
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _initializeVideoPlayer();
    _loadClassModuleByCourseId();
    loadMaterialByLessonId();
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
      _isLoadingVideo = false;
    });
  }

  Future<void> _loadClassModuleByCourseId() async {
    try {
      Lesson loadedLesson = await Network.getLessonByLessonId(widget.lessonId);

      if (loadedLesson?.isActive ?? true) {
        setState(() {
          chosenLesson = loadedLesson;
          _isLoading = false;
        });
      } else {
        // Handle the case where the loaded lesson is not active
        // For example, show a message to the user or perform another action
        print('The loaded lesson is not active');
      }
    } catch (e) {
      // Handle errors here
      print('Error loading lesson: $e');
    }
  }

  Future<void> loadMaterialByLessonId() async {
    List<Materials> loadedAssignment =
        await Network.getMaterialByLessonId(widget.lessonId);
    if (mounted) {
      setState(() {
        listMaterial = loadedAssignment;
      });
    }
  }

  void downloadFile(String url, name) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();

    if (statuses[Permission.storage]!.isGranted) {
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String savename = "${name}.pdf";
        String savePath = dir.path + "/$savename";
        print(savePath);
        //output:  /storage/emulated/0/Download/banner.png
        try {
          await Dio().download(url, savePath,
              onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
              //you can build progressbar feature too
            }
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Container(
              height: 40.0, // Adjust the height as needed
              alignment: Alignment.center,
              child: Text(
                'Download success',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            backgroundColor: Color(0xffff9300),
            // Customize the background color
            duration: Duration(seconds: 1),
            // Adjust the duration as needed
            behavior: SnackBarBehavior
                .floating, // Makes the SnackBar float in the center
          ));
        } on DioError catch (e) {
          print(e.message);
        }
      }
    } else {
      print("No permission to read and write.");
    }
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
                  if (widget.videoUrl != '' && widget.videoUrl != null)
                    _isLoadingVideo
                        ? Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: Chewie(controller: _chewieController),
                          ),
                  Container(
                    height: 52.v,
                    width: 360.h,
                    child: TabBar(
                      indicatorColor: Color(0xffff9300),
                      indicatorWeight: 6.0,
                      unselectedLabelColor: Colors.black,
                      labelColor: Color(0xffff9300),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700),
                      tabs: [
                        Tab(child: Text("Lesson")),
                        Tab(
                          child: Text("Material"),
                        )
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                  SizedBox(
                    height: 881.v,
                    // child: Navigator(
                    //   key: _navKey,
                    //   onGenerateRoute: (_) => MaterialPageRoute(
                    //     builder: (_) =>
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        LessonText(
                          chosenLesson: chosenLesson,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Adjust the height as needed
                            Center(child: Text('Choose Material to download')),
                            SingleChildScrollView(
                              child: ListBody(
                                children:
                                    listMaterial.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final item = entry.value;
                                  return TextButton(
                                    onPressed: () {
                                      downloadFile(
                                          listMaterial[index]
                                              .materialUrl
                                              .toString(),
                                          listMaterial[index].name.toString());
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                            constraints: const BoxConstraints(
                                              maxWidth: 200,
                                            ),
                                            child: Text(item.name.toString(),
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MaterialView(
                                                          url: listMaterial[
                                                                  index]
                                                              .materialUrl
                                                              .toString())),
                                            );
                                          },
                                          icon: Icon(
                                              Icons.remove_red_eye_outlined),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class LessonText extends StatelessWidget {
  const LessonText({
    super.key,
    required this.chosenLesson,
  });

  final Lesson chosenLesson;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
