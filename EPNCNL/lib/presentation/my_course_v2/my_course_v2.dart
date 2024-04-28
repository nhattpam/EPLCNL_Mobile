import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class my_course_v2 extends StatefulWidget {
  const my_course_v2({super.key});

  @override
  State<my_course_v2> createState() => _my_course_v2State();
}

class _my_course_v2State extends State<my_course_v2>
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
      length: 2, // Số lượng tab
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 150, // Điều chỉnh chiều cao của tab bar
              padding: const EdgeInsets.only(top: 40, bottom: 7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'My Courses',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 16,
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //Tab Bar
                  TabBar(
                    labelStyle: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                    tabs: [
                      Tab(
                        text: 'Ongoing',
                      ),
                      Tab(text: 'Completed'),
                    ],
                  ),
                ],
              ),
            ),
            //Them Class Tab Bar o day
            Expanded(
              child: TabBarView(
                children: [
                  Ongoing(),
                  Complete(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Ongoing Course Screen
class Ongoing extends StatelessWidget {
  const Ongoing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //dung de chia item khi khong du se xuong dong
            Wrap(
              spacing: 10, // Khoảng cách giữa các container
              children: [
                //Product ở đây
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 30,
                              height: 15,
                              child: Text(
                                '56%',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              child: Icon(
                                Icons.star_purple500_outlined,
                                size: 15,
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                              child: Text(
                                '5.0',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // thanh phan tram
                      LinearPercentIndicator(
                        width: 150,
                        lineHeight: 5.0,
                        percent: 0.56, // Phần trăm hoàn thành
                        backgroundColor: Colors.grey,
                        progressColor: Colors.orange,
                        alignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 30,
                              height: 15,
                              child: Text(
                                '56%',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              child: Icon(
                                Icons.star_purple500_outlined,
                                size: 15,
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                              child: Text(
                                '5.0',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // thanh phan tram
                      LinearPercentIndicator(
                        width: 150,
                        lineHeight: 5.0,
                        percent: 0.56, // Phần trăm hoàn thành
                        backgroundColor: Colors.grey,
                        progressColor: Colors.orange,
                        alignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 30,
                              height: 15,
                              child: Text(
                                '56%',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              child: Icon(
                                Icons.star_purple500_outlined,
                                size: 15,
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                              child: Text(
                                '5.0',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // thanh phan tram
                      LinearPercentIndicator(
                        width: 150,
                        lineHeight: 5.0,
                        percent: 0.56, // Phần trăm hoàn thành
                        backgroundColor: Colors.grey,
                        progressColor: Colors.orange,
                        alignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 30,
                              height: 15,
                              child: Text(
                                '56%',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              child: Icon(
                                Icons.star_purple500_outlined,
                                size: 15,
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                              child: Text(
                                '5.0',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // thanh phan tram
                      LinearPercentIndicator(
                        width: 150,
                        lineHeight: 5.0,
                        percent: 0.56, // Phần trăm hoàn thành
                        backgroundColor: Colors.grey,
                        progressColor: Colors.orange,
                        alignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 30,
                              height: 15,
                              child: Text(
                                '56%',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              child: Icon(
                                Icons.star_purple500_outlined,
                                size: 15,
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                              child: Text(
                                '5.0',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // thanh phan tram
                      LinearPercentIndicator(
                        width: 150,
                        lineHeight: 5.0,
                        percent: 0.56, // Phần trăm hoàn thành
                        backgroundColor: Colors.grey,
                        progressColor: Colors.orange,
                        alignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Complete Course
class Complete extends StatelessWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //dung de chia item khi khong du se xuong dong
            Wrap(
              spacing: 10, // Khoảng cách giữa các container
              children: [
                //Product ở đây
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 132,
                        height: 30,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Certificate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 10,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 132,
                        height: 30,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Certificate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 10,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 132,
                        height: 30,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Certificate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 10,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 132,
                        height: 30,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Certificate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 10,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19244895),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 120,
                        decoration: ShapeDecoration(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Product.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Text(
                          'Complete Wordpress Training For Beginners',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                          maxLines: 2, // Số dòng tối đa
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 132,
                        height: 30,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Certificate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 10,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
