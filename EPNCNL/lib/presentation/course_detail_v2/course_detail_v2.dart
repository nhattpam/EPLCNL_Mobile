import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class course_detail_v2 extends StatefulWidget {
  const course_detail_v2({super.key});

  @override
  State<course_detail_v2> createState() => _course_detail_v2State();
}

class _course_detail_v2State extends State<course_detail_v2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 390,
                floating: false,
                pinned: true,
                automaticallyImplyLeading:
                    false, // Thêm dòng này để ẩn đi biểu tượng mũi tên
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: ShapeDecoration(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/images/Course_detail.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              '5.0',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 300,
                          height: 55,
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Development of Virtual Reality & Augmented Reality ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow
                                .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                            maxLines:
                                2, // Số dòng tối đa trước khi hiển thị dấu "..."
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.update,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Last Update Apr. 5, 2022 ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.book_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '23 Lectures',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_circle_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Jack Smith',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '\$35.00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                  labelStyle: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 8,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                  tabs: [
                    Tab(
                      text: 'DESCRIPTION',
                    ),
                    Tab(text: 'LESSONS'),
                    Tab(
                      text: 'INSTRUCTOR',
                    ),
                    Tab(
                      text: 'REVIEWS',
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [discription(), Lesson(), instructor(), reviews()],
          ),
        ),
      ),
    );
  }
}

//discription
class discription extends StatelessWidget {
  const discription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 30,
                child: Text(
                  'About course',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                height: 150,
                child: Text(
                  'Welcome to Udemy s first, No Coding Required, VR development course, using VRTK 4. Build once and deploy to both Oculus and Steam VR devices.',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 1.9,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 30,
                child: Text(
                  'This Course Includes',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                child: Row(
                  children: [
                    Icon(
                      Icons.video_library_sharp,
                      size: 17,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '14 hours on-demand video',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                child: Row(
                  children: [
                    Icon(
                      Icons.file_download_outlined,
                      size: 17,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '16 downloadable resources',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                child: Row(
                  children: [
                    Icon(
                      Icons.fact_check_outlined,
                      size: 17,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Certificate of completion',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 330,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {}, // Gọi hàm _onPressed khi Container được nhấn
                  child: Container(
                    width: 335,
                    height: 53,
                    padding: const EdgeInsets.only(top: 15, bottom: 14),
                    decoration: ShapeDecoration(
                      color:
                          Color(0xFFFF9300), // Sử dụng màu đã được định nghĩa
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Buy Course',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//lesson
class Lesson extends StatefulWidget {
  @override
  _LessonState createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  bool isExpanded = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: GestureDetector(
                  onTap: toggleExpansion,
                  child: Container(
                    width: 350,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                color: Colors.white.withOpacity(0.7),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 30.0,
                                        child: CircularPercentIndicator(
                                          radius: 30.0,
                                          lineWidth: 2.0,
                                          percent: 0.7,
                                          center: Text(
                                            "70%",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          backgroundColor: Colors.grey,
                                          progressColor: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '02. Movement in VR',
                                            style: TextStyle(
                                              color: Color(0xFF111111),
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                '8 lectures',
                                                style: TextStyle(
                                                  color: Color(0xFF666666),
                                                  fontSize: 10,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                '1h 33 min',
                                                style: TextStyle(
                                                  color: Color(0xFF666666),
                                                  fontSize: 10,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
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
                            ),
                          ),
                        ),
                        if (isExpanded) ...[
                          SizedBox(height: 10),
                          _buildLessonRow(),
                          SizedBox(height: 10),
                          _buildLessonRow(),
                          SizedBox(height: 10),
                          _buildLessonRow(),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: GestureDetector(
                  onTap: toggleExpansion,
                  child: Container(
                    width: 350,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                color: Colors.white.withOpacity(0.7),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 30.0,
                                        child: CircularPercentIndicator(
                                          radius: 30.0,
                                          lineWidth: 2.0,
                                          percent: 0.7,
                                          center: Text(
                                            "70%",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          backgroundColor: Colors.grey,
                                          progressColor: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '02. Movement in VR',
                                            style: TextStyle(
                                              color: Color(0xFF111111),
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                '8 lectures',
                                                style: TextStyle(
                                                  color: Color(0xFF666666),
                                                  fontSize: 10,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                '1h 33 min',
                                                style: TextStyle(
                                                  color: Color(0xFF666666),
                                                  fontSize: 10,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
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
                            ),
                          ),
                        ),
                        if (isExpanded) ...[
                          SizedBox(height: 10),
                          _lesson2(),
                          SizedBox(height: 10),
                          _lesson2(),
                          SizedBox(height: 10),
                          _lesson2(),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 330,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {}, // Gọi hàm _onPressed khi Container được nhấn
                  child: Container(
                    width: 335,
                    height: 53,
                    padding: const EdgeInsets.only(top: 15, bottom: 14),
                    decoration: ShapeDecoration(
                      color:
                          Color(0xFFFF9300), // Sử dụng màu đã được định nghĩa
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Buy Course',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLessonRow() {
    return Row(
      children: [
        Container(
          width: 50,
          child: Icon(Icons.play_circle_outline_outlined),
        ),
        Column(
          children: [
            Container(
              width: 300,
              height: 20,
              child: Text(
                'Setting up individual Camera Rigs',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Container(
              width: 300,
              height: 20,
              child: Text(
                '00:44',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 10,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _lesson2() {
    return Row(
      children: [
        Container(
          width: 50,
          child: Icon(Icons.play_circle_outline_outlined),
        ),
        Column(
          children: [
            Container(
              width: 300,
              height: 20,
              child: Text(
                'Setting up individual Camera Rigs',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Container(
              width: 300,
              height: 20,
              child: Text(
                '00:44',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 10,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        )
      ],
    );
  }
}

//instructor
class instructor extends StatelessWidget {
  const instructor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 30,
                child: Text(
                  'Elizabeth Parker',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 30,
                child: Text(
                  'Professional Software Developer and Educator',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 10,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Container(
                      width: 91,
                      height: 91,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFF91CAFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                            height: 20,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '4.5 Instructor Rating',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                            height: 20,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.comment,
                                  size: 12,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '116 Reviews',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                            height: 20,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 12,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '936 Students',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                            height: 20,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_circle_fill,
                                  size: 12,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '12 Courses',
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 40,
                child: Text(
                  'About teacher',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 200,
                child: Text(
                  'I started working as a software developer at the age of 23, and never looked back. I explored careers as varied as being a  Game Developer, Educator and Drone Pilot, over the last 25 years. None of these provided a continual challenge in the same way the combination of...',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow
                      .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                  maxLines: 7, // Số dòng tối đa
                ),
              ),
              Container(
                width: 300,
                height: 20,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'Show More',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 11,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 40,
                child: Text(
                  'Student feedback',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: 300,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 90,
                          child: Text(
                            '4.8',
                            style: TextStyle(
                              color: Color(0xFFFFC700),
                              fontSize: 76,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            'Course Rating',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFFC700),
                              fontSize: 17,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 20,
                          child: Row(
                            children: [
                              LinearPercentIndicator(
                                width: 120.0,
                                lineHeight: 5.0,
                                percent: 0.85,
                                progressColor: Colors.green,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF8774FE),
                                  fontSize: 10,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                            children: [
                              LinearPercentIndicator(
                                width: 120.0,
                                lineHeight: 5.0,
                                percent: 0.1,
                                progressColor: Colors.green,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF8774FE),
                                  fontSize: 10,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                            children: [
                              LinearPercentIndicator(
                                width: 120.0,
                                lineHeight: 5.0,
                                percent: 0.85,
                                progressColor: Colors.green,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF8774FE),
                                  fontSize: 10,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                            children: [
                              LinearPercentIndicator(
                                width: 120.0,
                                lineHeight: 5.0,
                                percent: 0.85,
                                progressColor: Colors.green,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF8774FE),
                                  fontSize: 10,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                            children: [
                              LinearPercentIndicator(
                                width: 120.0,
                                lineHeight: 5.0,
                                percent: 0.85,
                                progressColor: Colors.green,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Color(0xFFFFC700),
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF8774FE),
                                  fontSize: 10,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 400,
                padding: EdgeInsets.only(left: 37),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'Courses',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      'View All',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 14,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward_ios, // Biểu tượng bạn muốn sử dụng
                      color: Color(0xFF111111),
                      size: 13,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 330,
                height: 180,
                child: CarouselSlider(
                  items: [
                    Column(
                      children: [
                        Container(
                          width: 230,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFE9BB3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/Popular 1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 30,
                                    child: Icon(
                                      Icons
                                          .favorite, // Biểu tượng bạn muốn sử dụng
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Container(
                                    width: 39,
                                    height: 20,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 14,
                                        ),
                                        Text(
                                          '5.0',
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 10,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 70,
                                child: Icon(
                                  Icons
                                      .play_circle_filled_outlined, // Biểu tượng bạn muốn sử dụng
                                  color: Colors.orange,
                                  size: 35,
                                ),
                              ),
                              Container(
                                width: 160,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User experience Design ',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'London Universiry',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // thêm itemm mới ở đây
                    Column(
                      children: [
                        Container(
                          width: 230,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFE9BB3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/Popular 1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 30,
                                    child: Icon(
                                      Icons
                                          .favorite, // Biểu tượng bạn muốn sử dụng
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Container(
                                    width: 39,
                                    height: 20,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 14,
                                        ),
                                        Text(
                                          '5.0',
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 10,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 70,
                                child: Icon(
                                  Icons
                                      .play_circle_filled_outlined, // Biểu tượng bạn muốn sử dụng
                                  color: Colors.orange,
                                  size: 35,
                                ),
                              ),
                              Container(
                                width: 160,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User experience Design ',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'London Universiry',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                  options: CarouselOptions(
                    height: 400,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage:
                        false, // Set to false to prevent enlarging the center page
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//reviews
class reviews extends StatelessWidget {
  const reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: 350,
                height: 100,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFE9BB3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/images/user.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 270,
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    'March 3, 2022',
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 10,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 270,
                            child: Text(
                              'Do Thanh Huy',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            width: 270,
                            height: 60,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lots of good info. ',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 3, // Số dòng tối đa
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 30, thickness: 0.1, color: Colors.black),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 100,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFE9BB3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/images/user.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 270,
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    'March 3, 2022',
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 10,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 270,
                            child: Text(
                              'Do Thanh Huy',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            width: 270,
                            height: 60,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lots of good info. ',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 3, // Số dòng tối đa
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 30, thickness: 0.1, color: Colors.black),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 100,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFE9BB3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/images/user.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 270,
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    'March 3, 2022',
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 10,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC700),
                                  size: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 270,
                            child: Text(
                              'Do Thanh Huy',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            width: 270,
                            height: 60,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lots of good info. ',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 3, // Số dòng tối đa
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 30, thickness: 0.1, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
