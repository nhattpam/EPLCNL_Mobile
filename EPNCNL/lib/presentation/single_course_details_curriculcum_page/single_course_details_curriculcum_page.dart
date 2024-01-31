import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/lessons.dart';
import 'package:meowlish/data/models/modules.dart';

import '../../network/network.dart';
import '../../widgets/custom_elevated_button.dart';

class SingleCourseDetailsCurriculumPage extends StatefulWidget {
  const SingleCourseDetailsCurriculumPage({Key? key}) : super(key: key);

  @override
  SingleCourseDetailsCurriculumPageState createState() =>
      SingleCourseDetailsCurriculumPageState();
}

class SingleCourseDetailsCurriculumPageState
    extends State<SingleCourseDetailsCurriculumPage> {
  // Placeholder tutor data

  late List<Module> listModule = [];
  late List<Lesson> listLesson = [];
  @override
  void initState() {
    super.initState();
    loadModule();
    loadLesson();
  }
  Future<void> loadModule() async {
    List<Module> loadedModule = await Network.getModule();
    setState(() {
      listModule = loadedModule;
    });
  }

  Future<void> loadLesson() async {
    List<Lesson> loadedLesson = await Network.getLesson();
    setState(() {
      listLesson = loadedLesson;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 17.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Use ListView.builder to build the list of tutors
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: listModule.length,
                        itemBuilder: (context, index) {
                          final modules = listModule[index];
                          final number = index + 1;
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Row(
                                  children: [
                                    Text("Session $number - ", style: theme.textTheme.labelMedium),
                                    Text(modules.name.toString(), style: CustomTextStyles.labelLargeOrangeA700),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: listLesson.length, // You may replace 3 with the actual number of details for each tutor
                                itemBuilder: (context, Index) {
                                  final lessons = listLesson[Index];
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CircleWithNumber(number: Index + 1),
                                      Padding(
                                        padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 5.v),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(lessons.name.toString(), style: CustomTextStyles.titleMedium17),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 50.v),
                                      Spacer(),
                                      Icon(
                                        Icons.play_arrow,
                                        size: 17.0,
                                        color: Colors.orange,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(height: 21.v),
                              Divider(),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 21.v),
                      CustomElevatedButton(
                        text: "Enroll Course",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CircleWithNumber extends StatelessWidget {
  final int number;

  CircleWithNumber({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffe8f1ff), // Change the color as needed
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.black, // Change the text color as needed
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = Colors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }
}