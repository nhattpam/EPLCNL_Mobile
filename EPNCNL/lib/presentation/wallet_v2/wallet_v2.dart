import 'dart:ui';

import 'package:flutter/material.dart';

class wallet_v2 extends StatefulWidget {
  const wallet_v2({super.key});

  @override
  State<wallet_v2> createState() => _wallet_v2State();
}

class _wallet_v2State extends State<wallet_v2>
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
                              'Wallet',
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
              SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              'Wallet',
                              style: TextStyle(
                                color: Color(0xFF120138),
                                fontSize: 24,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              'Active',
                              style: TextStyle(
                                color: Color(0xFFBDBDBD),
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.08,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 40),
                      width: 56,
                      height: 56,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/Profile Picture.png'),
                          fit: BoxFit.none,
                        ),
                        shape: OvalBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 310,
                height: 140,
                decoration: ShapeDecoration(
                  color: Color(0xFF45197D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Info Section.png'),
                    fit: BoxFit.none,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      width: 200,
                      child: Text(
                        'Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Spartan',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        '\$ 1.234',
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
              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2)),
                                ),
                                child: Icon(Icons.add_circle_outline_sharp),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Recharge',
                            style: TextStyle(
                              color: Color(0xFF8338FF),
                              fontSize: 13,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2)),
                                ),
                                child: Icon(Icons.file_upload_outlined),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Request',
                            style: TextStyle(
                              color: Color(0xFF8338FF),
                              fontSize: 13,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2)),
                                ),
                                child: Icon(Icons.attach_money),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'History',
                            style: TextStyle(
                              color: Color(0xFF8338FF),
                              fontSize: 13,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 400,
                padding: EdgeInsets.only(left: 37),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'Last Transaction',
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
                    Text(
                      'View All',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF8338FF),
                        fontSize: 13,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 280,
                    height: 100,
                    child: Row(
                      children: [
                        //image product
                        Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.orange.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/transaction.png"),
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            //transaction name
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                'Signature course name',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1, // Số dòng tối đa
                              ),
                            ),

                            //price
                            Container(
                              width: 200,
                              child: Text(
                                '\$ 29.99',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Container(
                              width: 200,
                              child: Row(
                                children: [
                                  //Date
                                  Container(
                                    width: 100,
                                    child: Text(
                                      '20/03/2022',
                                      style: TextStyle(
                                        color: Color(0xFF646A71),
                                        fontSize: 15,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFCC328C),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // status
                                  Container(
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                        color: Color(0xFF646A71),
                                        fontSize: 15,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
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
              Column(
                children: [
                  Container(
                    width: 280,
                    height: 100,
                    child: Row(
                      children: [
                        //image product
                        Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.orange.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/transaction.png"),
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            //transaction name
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                'Signature course name',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1, // Số dòng tối đa
                              ),
                            ),

                            //price
                            Container(
                              width: 200,
                              child: Text(
                                '\$ 29.99',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Container(
                              width: 200,
                              child: Row(
                                children: [
                                  //Date
                                  Container(
                                    width: 100,
                                    child: Text(
                                      '20/03/2022',
                                      style: TextStyle(
                                        color: Color(0xFF646A71),
                                        fontSize: 15,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFCC328C),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // status
                                  Container(
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                        color: Color(0xFF646A71),
                                        fontSize: 15,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
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
              Column(
                children: [
                  Container(
                    width: 280,
                    height: 100,
                    child: Row(
                      children: [
                        //image product
                        Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.orange.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/transaction.png"),
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            //transaction name
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                'Signature course name',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1, // Số dòng tối đa
                              ),
                            ),

                            //price
                            Container(
                              width: 200,
                              child: Text(
                                '\$ 29.99',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Container(
                              width: 200,
                              child: Row(
                                children: [
                                  //Date
                                  Container(
                                    width: 100,
                                    child: Text(
                                      '20/03/2022',
                                      style: TextStyle(
                                        color: Color(0xFF646A71),
                                        fontSize: 15,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFCC328C),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // status
                                  Container(
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                        color: Color(0xFF646A71),
                                        fontSize: 15,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
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
            ],
          ),
        ),
      ),
    );
  }
}
