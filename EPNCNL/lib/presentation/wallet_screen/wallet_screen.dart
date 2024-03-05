import 'package:flutter/material.dart';
import 'package:meowlish/core/utils/size_utils.dart';
import 'package:meowlish/data/models/refundrequests.dart';
import 'package:meowlish/data/models/transactions.dart';
import 'package:meowlish/data/models/wallets.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/search/search.dart';

import '../../data/models/accounts.dart';
import '../../theme/custom_text_style.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Account? account = Account();
  late Wallet? wallet = Wallet();
  late List<RefundRequest> listRefundRequests = [];
  FetchCourseList _userList = FetchCourseList();

  @override
  void initState() {
    super.initState();
    fetchAccountData();
    fetchWalletData();
    loadRefundRequests();
  }

  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
    });
  }

  Future<void> fetchWalletData() async {
    Wallet wlet = await Network.getWalletByAccountId();

    setState(() {
      // Set the list of pet containers in your state
      wallet = wlet;
    });
  }

  void loadRefundRequests() async {
    List<RefundRequest> loadedRefundRequest =
        await Network.getRefundRequestByLeanerId();
    setState(() {
      listRefundRequests = loadedRefundRequest;
    });
  }
  void _showTopic(String refundId) async {
    final List<String>? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return RequestDetail(refundId: refundId);
        });
  }
  @override
  Widget build(BuildContext context) {
    listRefundRequests.sort((a, b) => DateTime.parse(b.requestedDate.toString())
        .compareTo(DateTime.parse(a.requestedDate.toString())));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9300),
        elevation: 0.0,
        toolbarHeight: 65,
        flexibleSpace: FlexibleSpaceBar(
          title: Container(
            margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
            width: 300,
            height: 100, // Add margin
            child: Text(
              'Wallet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffff9300),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(account?.imageUrl ?? '')),
                  Container(
                    padding: EdgeInsets.only(right: 80),
                    child: Column(
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (wallet?.balance ?? '').toString() + '\$',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 26, left: 16, right: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Request Refund",
                      style: TextStyle(
                          color: Color(0xffff9300),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listRefundRequests.length,
                        // Number of items in your list
                        itemBuilder: (BuildContext context, int index) {
                          final refundrequest = listRefundRequests[index];
                          return listTile(
                              refundrequest.transaction?.course?.imageUrl ?? '',
                              Colors.white,
                              refundrequest.transaction?.course?.name ?? '',
                              refundrequest.status ?? '',
                              refundrequest.transaction?.course?.stockPrice ??
                                  0,
                              refundrequest?.requestedDate ?? '',
                          refundrequest?.id ?? '');
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget listTile(String imageurl, Color color, String type, String tittle, num value, String date, String id) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate =
        "${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}-${dateTime.year}";
    Color tileColor;
    if (tittle == "PROCESSING") {
      tileColor = Color(0xbbff9300);
    } else if (tittle == "DONE") {
      tileColor = Colors.green;
    } else {
      tileColor = Colors.red;
    }
    return InkWell(
      onTap: () {
        _showTopic(id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: tileColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(0xffff9300),
                  borderRadius: BorderRadius.circular(8)),
              child: Image.network(imageurl, fit: BoxFit.cover),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(type,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(tittle,
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text("|", style: TextStyle(color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(formattedDate,
                            style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text("$value\$",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}


class RequestDetail extends StatefulWidget {
  final refundId;

  const RequestDetail({super.key, this.refundId});

  @override
  State<RequestDetail> createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  late RefundRequest chosenRefund = RefundRequest();

  @override
  void initState() {
    super.initState();
    loadRefundRequestById();
  }

  Future<void> loadRefundRequestById() async {
    try {
      final refund = await Network.getRefundRequestById(widget.refundId);
      setState(() {
        chosenRefund = refund;
      });
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedRefundDate;
    String formattedApproveDate;

    if (chosenRefund.requestedDate != null) {
      DateTime dateTime = DateTime.parse(chosenRefund.requestedDate.toString());
      formattedRefundDate =
      "${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}-${dateTime.year}";
    } else {
      formattedRefundDate = 'No date available'; // Or any other default value or behavior you prefer
    }
    if (chosenRefund.approvedDate != null) {
      DateTime dateTime = DateTime.parse(chosenRefund.approvedDate.toString());
      formattedApproveDate =
      "${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}-${dateTime.year}";
    } else {
      formattedApproveDate = 'No date'; // Or any other default value or behavior you prefer
    }

    return AlertDialog(
      title: Center(child: Text('Refund Request Detail')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Adjust the height as needed
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Status: " + chosenRefund.status.toString()),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Reason: " + chosenRefund.reason.toString()),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Request Date: " + formattedRefundDate),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Approve Date: " + formattedApproveDate),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
