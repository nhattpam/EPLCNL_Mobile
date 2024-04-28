import 'package:flutter/material.dart';

class review_screenv2 extends StatefulWidget {
  const review_screenv2({super.key});

  @override
  State<review_screenv2> createState() => _review_screenv2State();
}

class _review_screenv2State extends State<review_screenv2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _rating = 0; // Biến để theo dõi số sao được chọn
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
        child: Container(
          //màu background
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
                //Header
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
                      Container(
                        width: 250,
                        alignment: Alignment.center,
                        child: Text(
                          'Leave a Review',
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
                  height: 30,
                ),
                //Hình ảnh
                Container(
                  width: 301,
                  height: 214,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Review.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Please rate the course!
                Container(
                  width: 260,
                  height: 30,
                  child: Text(
                    'Please rate the course!',
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
                //Rating
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Cập nhật biến _rating với giá trị của index + 1 (vì index bắt đầu từ 0)
                            _rating = index + 1;
                          });
                        },
                        child: Icon(
                          // Chọn màu sắc cho các ngôi sao dựa trên việc có được chọn hay không
                          index < _rating ? Icons.star : Icons.star_border,
                          color: Colors.orange,
                          size: 40,
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Your comments and suggestions help us imprave the service quality better!
                Container(
                  width: 320,
                  height: 70,
                  child: Text(
                    'Your comments and suggestions help us imprave the service quality better!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                // Comment
                Container(
                  width: 335,
                  height: 200,
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 25,
                    right: 10,
                    bottom: 0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.65),
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
                      Expanded(
                        child: TextField(
                          maxLines: null, // Để cho phép nhiều dòng
                          keyboardType: TextInputType
                              .multiline, // Để hiển thị bàn phím với nhiều dòng
                          style: TextStyle(
                            color: Colors.black, // Màu văn bản
                            fontSize: 16, // Kích thước văn bản
                            fontFamily: 'Spartan', // Font chữ
                            fontWeight: FontWeight.normal, // Độ đậm của văn bản
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your text here...',
                            hintStyle: TextStyle(
                              color: Colors.grey, // Màu văn bản gợi ý
                              fontSize: 16, // Kích thước văn bản gợi ý
                              fontFamily:
                                  'Spartan', // Font chữ của văn bản gợi ý
                              fontWeight:
                                  FontWeight.normal, // Độ đậm của văn bản gợi ý
                            ),
                            border: InputBorder.none, // Ẩn viền của TextField
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                //Button
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
                          'Submit',
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
        ),
      ),
    );
  }
}
