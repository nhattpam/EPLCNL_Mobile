import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/login_screen/login_screen.dart';
import 'package:meowlish/presentation/register_now_screen/register_now_screen.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class SingleCourseDetailsCurriculumPage extends StatefulWidget {
  const SingleCourseDetailsCurriculumPage({Key? key})
      : super(
          key: key,
        );

  @override
  SingleCourseDetailsCurriculumPageState createState() =>
      SingleCourseDetailsCurriculumPageState();
}

class SingleCourseDetailsCurriculumPageState
    extends State<SingleCourseDetailsCurriculumPage>
    with SingleTickerProviderStateMixin {
  int current = 0;
  List<String> items = ["About", "Curriculum"];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return _buildScrollView(context);
  }
}

/// Section Widget
Widget _buildScrollView(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      ),
  );
}

class ImageCourseContainer extends StatelessWidget {
  const ImageCourseContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(0),
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.1))),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                  backgroundColor: Colors.white.withOpacity(0.1)),
            )
          ],
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
