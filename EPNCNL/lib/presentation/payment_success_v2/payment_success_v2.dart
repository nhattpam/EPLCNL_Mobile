import 'package:flutter/material.dart';

class payment_success_v2 extends StatefulWidget {
  const payment_success_v2({super.key});

  @override
  State<payment_success_v2> createState() => _payment_success_v2State();
}

class _payment_success_v2State extends State<payment_success_v2>
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white, // Màu đỏ vàng
                Colors.white, // Màu trắng
                // Màu vàng nhiều
                // Màu trắng nhạt
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: 200,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/payment method.png"),
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
                Container(
                  width: 320,
                  height: 50,
                  child: Text(
                    'Your payment is successful, Thank you!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
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
                          'Continue',
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
