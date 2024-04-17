import 'dart:ui';

import 'package:flutter/material.dart';

class Recharge_v2 extends StatefulWidget {
  const Recharge_v2({super.key});

  @override
  State<Recharge_v2> createState() => _Recharge_v2State();
}

class _Recharge_v2State extends State<Recharge_v2>
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
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        // Thực hiện điều hướng tới màn hình mới ở đây
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MyApp()),
        // );
      },
    );
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
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFFCF8C), // Màu đỏ vàng
                      Colors.white, // Màu trắng
                      // Màu vàng nhiều
                      // Màu trắng nhạt
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 300,
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
                                    'Recharge',
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
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: 200,
                            height: 50,
                            child: Text(
                              'How much you want to \Recharge today ?',
                              style: TextStyle(
                                color: Color(0xFF9D70FF),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            width: 160,
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Group 12788.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 130,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(1),
                            Color(0xFFFFCF8C).withOpacity(0.5),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 210,
                                      padding:
                                          EdgeInsets.only(top: 5, left: 20),
                                      child: Text(
                                        'Enter Your Money',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F39),
                                          fontSize: 18,
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
                                      height: 20,
                                    ),
                                    //time
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 50),
                            width: 230,
                            child: TextField(
                              keyboardType:
                                  TextInputType.number, // Chỉ cho phép nhập số
                              style: TextStyle(
                                fontFamily: 'Lato',
                                // Thay đổi kiểu chữ của văn bản
                                color: Colors.black, // Màu của văn bản
                                fontSize: 16, // Kích thước của văn bản
                                fontWeight:
                                    FontWeight.w500, // Độ đậm của văn bản
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter Money',
                                hintStyle: TextStyle(
                                  // Thay đổi kiểu chữ của gợi ý
                                  color: Colors.grey, // Màu của gợi ý
                                  fontSize: 14, // Kích thước của gợi ý
                                  fontWeight:
                                      FontWeight.normal, // Độ đậm của gợi ý
                                ),
                                filled:
                                    true, // Đặt filled thành true để có thể thay đổi màu nền
                                fillColor: Colors.white, // Màu nền của ô nhập
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide
                                      .none, // Đặt borderSide thành BorderSide.none để ẩn viền
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 400,
                      height: 50,
                      padding: EdgeInsets.only(left: 37),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              'Payment Method',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 18,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                        ],
                      ),
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
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
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
                      height: 50,
                    ),
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
                              'Recharge',
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
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
