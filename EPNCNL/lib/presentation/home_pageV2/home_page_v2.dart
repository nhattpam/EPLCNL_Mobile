import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class home_page_v2 extends StatefulWidget {
  const home_page_v2({super.key});

  @override
  State<home_page_v2> createState() => _home_page_v2State();
}

class _home_page_v2State extends State<home_page_v2>
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                // Header
                Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.orange, // Màu đỏ vàng
                        Colors.white, // Màu trắng
                        // Màu vàng nhiều
                        // Màu trắng nhạt
                      ],
                    ),
                  ),
                  child: Center(
                    child: Container(
                        child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hola, Do Thanh Huy !',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Spartan',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: 0.26,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'What do you wanna learn today?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Plus Jakarta Display',
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                    letterSpacing: 0.14,
                                  ),
                                )
                              ],
                            )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(70),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://via.placeholder.com/50x50"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Course
                Container(
                  width: 400,
                  height: 220,
                  child: CarouselSlider(
                    items: [
                      Container(
                        width: 335,
                        height: 220,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.orange, // Màu đỏ vàng
                              Colors.white, // Màu trắng
                              // Màu vàng nhiều
                              // Màu trắng nhạt
                            ],
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/img.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 300,
                                height: 50,
                                child: Text(
                                  'Complete Wordpress Training For Beginners',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Spartan',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow
                                      .visible, // Để chữ tự động xuống dòng khi quá dài
                                  maxLines:
                                      2, // Số dòng tối đa trước khi xuống dòng
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 300,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons
                                          .access_time_outlined, // Thay 'add' bằng mã biểu tượng mong muốn
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '5h 30m',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Text(
                                      '\$35.00',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
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
                      ),
                    ],
                    options: CarouselOptions(
                      height: 250,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Learning Plan
                Container(
                  width: 400,
                  padding: EdgeInsets.only(left: 37),
                  child: Text(
                    'Learning Plan',
                    style: TextStyle(
                      color: Color(0xFF1F1F39),
                      fontSize: 18,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, width: 2), // Thiết lập viền
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: CircularPercentIndicator(
                              radius: 30, // Bán kính của hình tròn
                              lineWidth: 4.0, // Độ dày của dải tiến trình
                              percent:
                                  0.5, // Phần trăm đã hoàn thành (0.5 tương ứng với 50%)
                              backgroundColor: Colors.grey,
                              progressColor: Colors.orange,
                            ),
                          ),
                          Container(
                            width: 140,
                            child: Text(
                              'Packaging Design ',
                              style: TextStyle(
                                color: Color(0xFF1F1F39),
                                fontSize: 14,
                                fontFamily: 'Spartan',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 1, // Số dòng tối đa
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1),
                          Container(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '40',
                                    style: TextStyle(
                                      color: Color(0xFF1F1F39),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/48',
                                    style: TextStyle(
                                      color: Color(0xFFB8B8D2),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: CircularPercentIndicator(
                              radius: 30, // Bán kính của hình tròn
                              lineWidth: 4.0, // Độ dày của dải tiến trình
                              percent:
                                  0.5, // Phần trăm đã hoàn thành (0.5 tương ứng với 50%)
                              backgroundColor: Colors.grey,
                              progressColor: Colors.orange,
                            ),
                          ),
                          Container(
                            width: 140,
                            child: Text(
                              'Packaging Design ',
                              style: TextStyle(
                                color: Color(0xFF1F1F39),
                                fontSize: 14,
                                fontFamily: 'Spartan',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 1, // Số dòng tối đa
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1),
                          Container(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '40',
                                    style: TextStyle(
                                      color: Color(0xFF1F1F39),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/48',
                                    style: TextStyle(
                                      color: Color(0xFFB8B8D2),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                                width: 70,
                                height: 20,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                      Icons
                                          .arrow_forward_ios, // Biểu tượng bạn muốn sử dụng
                                      color: Color(0xFF111111),
                                      size: 13,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                //Categories
                Container(
                  width: 400,
                  padding: EdgeInsets.only(left: 37),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            color: Color(0xFF1F1F39),
                            fontSize: 18,
                            fontFamily: 'Spartan',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
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
                  height: 10,
                ),
                Container(
                  height: 140,
                  width: 400,
                  child: Center(
                    child: Container(
                      child: CarouselSlider(
                        items: [
                          Row(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: 148,
                                                height: 89,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFABC9FB),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Categories 3.png'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 120,
                                                      height: 40,
                                                      child: Text(
                                                        'Beginner ',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 0.11,
                                                        ),
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Add new item here
                          Row(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: 148,
                                                height: 89,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFABC9FB),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Categories 2.png'), // Replace with your image path
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 120,
                                                      height: 40,
                                                      child: Text(
                                                        'New Item',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 0.11,
                                                        ),
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: 148,
                                                height: 89,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFABC9FB),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Categories 1.png'), // Replace with your image path
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 120,
                                                      height: 40,
                                                      child: Text(
                                                        'New Item',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 0.11,
                                                        ),
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                        options: CarouselOptions(
                          height: 300,
                          enableInfiniteScroll: true,
                          initialPage: 1,
                          autoPlay: false,
                          scrollDirection: Axis.horizontal, // or Axis.vertical
                          enlargeCenterPage: true,
                          viewportFraction: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //Top Rate
                Container(
                    width: 400,
                    padding: EdgeInsets.only(left: 37),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            'Top rated',
                            style: TextStyle(
                              color: Color(0xFF1F1F39),
                              fontSize: 18,
                              fontFamily: 'Spartan',
                              fontWeight: FontWeight.w500,
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
                          Icons
                              .arrow_forward_ios, // Biểu tượng bạn muốn sử dụng
                          color: Color(0xFF111111),
                          size: 13,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 400,
                  width: 450,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 90,
                            height: 90,
                            padding: const EdgeInsets.only(
                                top: 0, left: 2, bottom: 5),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD6DBFD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/TopRate 1.png"),
                                fit: BoxFit.none,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: 180,
                                    height: 50,
                                    child: Text(
                                      'Learning Python for Data Analysis and Visualization 123123',
                                      style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          height: 1.5),
                                      maxLines: 2, // Giới hạn số dòng
                                      overflow: TextOverflow
                                          .ellipsis, // Hiển thị "..." khi quá dài
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ],
                              ),
                              Container(
                                width: 230,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '5h 30m',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Text(
                                      '\$35.00',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 16,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        // Add Divider here
                        thickness: 0.5, // Độ dày của đường phân cách
                        color: Colors.grey, // Màu của đường phân cách
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 90,
                            height: 90,
                            padding: const EdgeInsets.only(
                                top: 0, left: 2, bottom: 5),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD6DBFD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/TopRate 1.png"),
                                fit: BoxFit.none,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: 180,
                                    height: 50,
                                    child: Text(
                                      'Learning Python for Data Analysis and Visualization 123123',
                                      style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          height: 1.5),
                                      maxLines: 2, // Giới hạn số dòng
                                      overflow: TextOverflow
                                          .ellipsis, // Hiển thị "..." khi quá dài
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ],
                              ),
                              Container(
                                width: 230,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '5h 30m',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Text(
                                      '\$35.00',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 16,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        // Add Divider here
                        thickness: 0.5, // Độ dày của đường phân cách
                        color: Colors.grey, // Màu của đường phân cách
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 90,
                            height: 90,
                            padding: const EdgeInsets.only(
                                top: 0, left: 2, bottom: 5),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD6DBFD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/TopRate 1.png"),
                                fit: BoxFit.none,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: 180,
                                    height: 50,
                                    child: Text(
                                      'Learning Python for Data Analysis and Visualization 123123',
                                      style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          height: 1.5),
                                      maxLines: 2, // Giới hạn số dòng
                                      overflow: TextOverflow
                                          .ellipsis, // Hiển thị "..." khi quá dài
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ],
                              ),
                              Container(
                                width: 230,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '5h 30m',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Text(
                                      '\$35.00',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 16,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //Popular
                Container(
                  width: 400,
                  padding: EdgeInsets.only(left: 37),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          'Popular',
                          style: TextStyle(
                            color: Color(0xFF1F1F39),
                            fontSize: 18,
                            fontFamily: 'Spartan',
                            fontWeight: FontWeight.w500,
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
                  height: 10,
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
                                image:
                                    AssetImage("assets/images/Popular 1.png"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                image:
                                    AssetImage("assets/images/Popular 1.png"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                Container(
                  width: 400,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          'Instructors',
                          style: TextStyle(
                            color: Color(0xFF1F1F39),
                            fontSize: 18,
                            fontFamily: 'Spartan',
                            fontWeight: FontWeight.w500,
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
                  height: 5,
                ),
                //
                Container(
                  width: 450,
                  height: 150,
                  child: CarouselSlider(
                    items: [
                      Container(
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    width: 86,
                                    height: 86,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Instructors 1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 86,
                                    height: 50,
                                    child: Text(
                                      'Do Thanh Huy 2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF17191B),
                                        fontSize: 13,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    width: 86,
                                    height: 86,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Instructors 1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 86,
                                    height: 50,
                                    child: Text(
                                      'Do Thanh Huy ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF17191B),
                                        fontSize: 13,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    width: 86,
                                    height: 86,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Instructors 1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 86,
                                    height: 50,
                                    child: Text(
                                      'Do Thanh Huy 3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF17191B),
                                        fontSize: 13,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 200,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      viewportFraction: 0.3,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage:
                          false, // Set to false to prevent enlarging the center page
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_filled),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.book),
            label: 'My Course',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search),
            label: 'Search',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.messenger),
            label: 'Message',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Personal',
          ),
        ],
        buttonBackgroundColor: Color(0xFFFFCF8C),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
