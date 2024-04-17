import 'package:flutter/material.dart';

class message_notification_v2 extends StatefulWidget {
  const message_notification_v2({super.key});

  @override
  State<message_notification_v2> createState() =>
      _message_notification_v2State();
}

class _message_notification_v2State extends State<message_notification_v2>
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
                      'Notifications',
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
                        text: 'Message',
                      ),
                      Tab(text: 'Notification'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  message(),
                  notification(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// message
class message extends StatelessWidget {
  const message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // iteam message
              Container(
                width: 330,
                height: 160,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0.5),
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
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 28),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF9EAF3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Product.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              //Name Course
                              Container(
                                width: 150,
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Bert Pullman',
                                  style: TextStyle(
                                    color: Color(0xFF1F1F39),
                                    fontSize: 15,
                                    fontFamily: 'Spartan',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                  maxLines:
                                      1, // Số dòng tối đa trước khi hiển thị dấu "..."
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //time
                              Container(
                                width: 150,
                                child: Text(
                                  '04:32 pm',
                                  style: TextStyle(
                                    color: Color(0xFF858597),
                                    fontSize: 13,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Learner Name
                          Container(
                            width: 100,
                            child: Text('Do Thanh Huy :',
                                style: TextStyle(
                                  color: Color(0xFF858597),
                                  fontSize: 13,
                                  fontFamily: 'lato',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          //message
                          Container(
                            width: 160,
                            child: Text(
                              'Congratulations on completing the first lesson, keep up the good work! ',
                              style: TextStyle(
                                color: Color(0xFF858597),
                                fontSize: 13,
                                fontFamily: 'lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines:
                                  1, // Số dòng tối đa trước khi hiển thị dấu "..."
                            ),
                          )
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
                width: 330,
                height: 160,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0.5),
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
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 28),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF9EAF3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Product.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              //Name Course
                              Container(
                                width: 150,
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Bert Pullman',
                                  style: TextStyle(
                                    color: Color(0xFF1F1F39),
                                    fontSize: 15,
                                    fontFamily: 'Spartan',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                  maxLines:
                                      1, // Số dòng tối đa trước khi hiển thị dấu "..."
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //time
                              Container(
                                width: 150,
                                child: Text(
                                  '04:32 pm',
                                  style: TextStyle(
                                    color: Color(0xFF858597),
                                    fontSize: 13,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Learner Name
                          Container(
                            width: 100,
                            child: Text('Do Thanh Huy :',
                                style: TextStyle(
                                  color: Color(0xFF858597),
                                  fontSize: 13,
                                  fontFamily: 'lato',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          //message
                          Container(
                            width: 160,
                            child: Text(
                              'Congratulations on completing the first lesson, keep up the good work! ',
                              style: TextStyle(
                                color: Color(0xFF858597),
                                fontSize: 13,
                                fontFamily: 'lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines:
                                  1, // Số dòng tối đa trước khi hiển thị dấu "..."
                            ),
                          )
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
                width: 330,
                height: 160,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0.5),
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
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 28),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF9EAF3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Product.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              //Name Course
                              Container(
                                width: 150,
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Bert Pullman',
                                  style: TextStyle(
                                    color: Color(0xFF1F1F39),
                                    fontSize: 15,
                                    fontFamily: 'Spartan',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                  maxLines:
                                      1, // Số dòng tối đa trước khi hiển thị dấu "..."
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //time
                              Container(
                                width: 150,
                                child: Text(
                                  '04:32 pm',
                                  style: TextStyle(
                                    color: Color(0xFF858597),
                                    fontSize: 13,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Learner Name
                          Container(
                            width: 100,
                            child: Text('Do Thanh Huy :',
                                style: TextStyle(
                                  color: Color(0xFF858597),
                                  fontSize: 13,
                                  fontFamily: 'lato',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          //message
                          Container(
                            width: 160,
                            child: Text(
                              'Congratulations on completing the first lesson, keep up the good work! ',
                              style: TextStyle(
                                color: Color(0xFF858597),
                                fontSize: 13,
                                fontFamily: 'lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines:
                                  1, // Số dòng tối đa trước khi hiển thị dấu "..."
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
      ),
    );
  }
}

//notification
class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // iteam notification
              Container(
                width: 330,
                height: 110,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0.5),
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
                          //image notification
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 28),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF9EAF3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/bank-card.png"),
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              //notification content
                              Container(
                                width: 210,
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Successful purchase!',
                                  style: TextStyle(
                                    color: Color(0xFF1F1F39),
                                    fontSize: 13,
                                    fontFamily: 'Spartan',
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
                              Container(
                                width: 210,
                                child: Text(
                                  '04:32 pm',
                                  style: TextStyle(
                                    color: Color(0xFF858597),
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 330,
                height: 110,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0.5),
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
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 28),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF9EAF3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/bank-card.png"),
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              //Name Course
                              Container(
                                width: 210,
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Successful purchase!',
                                  style: TextStyle(
                                    color: Color(0xFF1F1F39),
                                    fontSize: 13,
                                    fontFamily: 'Spartan',
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
                              Container(
                                width: 210,
                                child: Text(
                                  '04:32 pm',
                                  style: TextStyle(
                                    color: Color(0xFF858597),
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 330,
                height: 110,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0.5),
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
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 28),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF9EAF3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/bank-card.png"),
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              //Name Course
                              Container(
                                width: 210,
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Successful purchase!',
                                  style: TextStyle(
                                    color: Color(0xFF1F1F39),
                                    fontSize: 13,
                                    fontFamily: 'Spartan',
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
                              Container(
                                width: 210,
                                child: Text(
                                  '04:32 pm',
                                  style: TextStyle(
                                    color: Color(0xFF858597),
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
