import 'package:flutter/material.dart';

class history_wallet_v2 extends StatefulWidget {
  const history_wallet_v2({super.key});

  @override
  State<history_wallet_v2> createState() => _history_wallet_v2State();
}

class _history_wallet_v2State extends State<history_wallet_v2>
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
                        'History',
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
                height: 10,
              ),
              //Transaction
              Column(
                children: [
                  Container(
                    width: 280,
                    height: 100,
                    child: Row(
                      children: [
                        //image product
                        Container(
                          width: 62,
                          height: 86,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.orange.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
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
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1, // Số dòng tối đa
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //price
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                '+\$ 29.99',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                                      'VN Pay',
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
                  // Divider
                  Container(
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.4,
                    ),
                  )
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
                          width: 62,
                          height: 86,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.orange.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
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
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1, // Số dòng tối đa
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //price
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                '+\$ 29.99',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                                      'VN Pay',
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
                  // Divider
                  Container(
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.4,
                    ),
                  )
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
                          width: 62,
                          height: 86,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.orange.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
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
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                'Wallet',
                                style: TextStyle(
                                  color: Color(0xFF17191B),
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu "..." khi văn bản quá dài
                                maxLines: 1, // Số dòng tối đa
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //price
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                '+\$ 29.99',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                                      'VN Pay',
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
                  // Divider
                  Container(
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.4,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
