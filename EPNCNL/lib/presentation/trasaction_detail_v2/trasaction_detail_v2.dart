import 'package:flutter/material.dart';

class trasaction_detail_v2 extends StatefulWidget {
  const trasaction_detail_v2({super.key});

  @override
  State<trasaction_detail_v2> createState() => _trasaction_detail_v2State();
}

class _trasaction_detail_v2State extends State<trasaction_detail_v2>
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
        child: Center(
          child: Column(
            children: <Widget>[
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
                        'E-Receipt',
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
                height: 40,
              ),
              //image banner
              Container(
                width: 166,
                height: 163.53,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Transacion_detail.png"),
                    fit: BoxFit.none,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //QR code
              Container(
                width: 270,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/QR.png"),
                    fit: BoxFit.none,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //information
              Container(
                child: Column(
                  children: [
                    //name
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            child: Text(
                              'Name',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              textAlign: TextAlign.right,
                              'Scott R. Shoemake',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 2, // Số dòng tối đa
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Email ID
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            child: Text(
                              'Email ID',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              textAlign: TextAlign.right,
                              'shoemake.redial@gmail.com',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 2, // Số dòng tối đa
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Course
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            child: Text(
                              'Course',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              textAlign: TextAlign.right,
                              'Complete Wordpress Training For Beginners',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 2, // Số dòng tối đa
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Price
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              textAlign: TextAlign.right,
                              '\$55.00',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 2, // Số dòng tối đa
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Date
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            child: Text(
                              'Date',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              textAlign: TextAlign.right,
                              '10/07/2001, 15:45',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 2, // Số dòng tối đa
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Status
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            height: 22,
                            child: Text(
                              'Status',
                              style: TextStyle(
                                color: Color(0xFF202244),
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF167F71),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.60,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Color(0xFF167F71),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Done',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                              maxLines: 1, // Số dòng tối đa
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
