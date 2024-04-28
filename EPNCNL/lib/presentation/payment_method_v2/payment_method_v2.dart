import 'dart:ui';

import 'package:flutter/material.dart';

class payment_method_v2 extends StatefulWidget {
  const payment_method_v2({super.key});

  @override
  State<payment_method_v2> createState() => _payment_method_v2State();
}

class _payment_method_v2State extends State<payment_method_v2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Color _buttonColor = Color(0xFFFF9300);
  void _onPressed() {
    // Thực hiện bất kỳ hành động nào bạn muốn khi nút được nhấn
    setState(
      () {
        // Thay đổi màu sắc của nút khi được nhấn
        _buttonColor = Colors.black;
      },
    );

    // Điều hướng sang màn hình mới sau một khoảng thời gian ngắn
    Future.delayed(Duration(milliseconds: 100), () {
      // Thực hiện điều hướng tới màn hình mới ở đây
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MyApp()),
      // );
    });
  }

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
          height: 700,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFF9300), // Màu đỏ vàng
                Colors.white, // Màu trắng
                // Màu vàng nhiều
                // Màu trắng nhạt
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                //header
                Container(
                  width: 375,
                  height: 90,
                  padding: const EdgeInsets.only(top: 40, bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //icon back
                      Container(
                        width: 50,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      // header name
                      Container(
                        width: 250,
                        alignment: Alignment.center,
                        child: Text(
                          'Choose payment method',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 16,
                            fontFamily: 'Spartan',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                //Course
                Container(
                  height: 100,
                  width: 450,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          //image course
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
                                  //name course
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: 200,
                                    height: 50,
                                    child: Text(
                                      textAlign: TextAlign.left,
                                      'Learning Python for Data Analysis and Visualization ',
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
                                ],
                              ),
                              // time course
                              Container(
                                width: 230,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '5h 30m',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    //price
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //thanh toán VN pay
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.2), width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            // Xử lý khi người dùng nhấn nút
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => payment_choose(),
                            //   ),
                            // );
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'VN Pay',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  height: 0.11,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              trailing: Checkbox(
                                value:
                                    true, // Thay đổi giá trị này tùy thuộc vào trạng thái của checkbox
                                onChanged: (newValue) {
                                  // Xử lý khi trạng thái của checkbox thay đổi
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //thanh toán Wallet
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.2), width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            // Xử lý khi người dùng nhấn nút
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => payment_choose(),
                            //   ),
                            // );
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  height: 0.11,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              trailing: Checkbox(
                                value:
                                    false, // Thay đổi giá trị này tùy thuộc vào trạng thái của checkbox
                                onChanged: (newValue) {
                                  // Xử lý khi trạng thái của checkbox thay đổi
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 230,
                ),
                //button pay now
                GestureDetector(
                  onTap:
                      _onPressed, // Gọi hàm _onPressed khi Container được nhấn
                  child: Container(
                    width: 300,
                    height: 60,
                    padding: const EdgeInsets.only(top: 15, bottom: 14),
                    decoration: ShapeDecoration(
                      color: _buttonColor, // Sử dụng màu đã được định nghĩa
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
                          'Pay Now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
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
