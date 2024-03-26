import 'package:flutter/material.dart';

class compelete_coursev2 extends StatefulWidget {
  const compelete_coursev2({super.key});

  @override
  State<compelete_coursev2> createState() => _compelete_coursev2State();
}

class _compelete_coursev2State extends State<compelete_coursev2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Color _buttonColor = Color(0xFFFF9300);
  void _onPressed() {
    // Thực hiện bất kỳ hành động nào bạn muốn khi nút được nhấn
    setState(() {
      // Thay đổi màu sắc của nút khi được nhấn
      _buttonColor = Colors.black;
    });

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
        //màu nền back ground
        child: Container(
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
          child: Center(
            child: Column(
              children: <Widget>[
                //header
                Container(
                  width: 375,
                  height: 70,
                  padding: const EdgeInsets.only(top: 40, bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //banner
                Container(
                  width: 370,
                  height: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/compelete course.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Text Congratulations
                Container(
                  width: 260,
                  height: 30,
                  child: Text(
                    'Congratulations!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 20,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //You have successfully completed the course!....
                Container(
                  width: 320,
                  height: 70,
                  child: Text(
                    'You have successfully completed the course! We wish you new victories, participation and success in all your endeavors!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                //Button Leave Feedback
                GestureDetector(
                  onTap:
                      _onPressed, // Gọi hàm _onPressed khi Container được nhấn
                  child: Container(
                    width: 335,
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
                          'Leave Feedback',
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
                  height: 30,
                ),
                //Download Certificate
                Container(
                  width: 300,
                  height: 100,
                  child: Text(
                    'Download Certificate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 14,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w500,
                      height: 0.12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
