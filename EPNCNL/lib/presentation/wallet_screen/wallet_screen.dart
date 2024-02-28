import 'package:flutter/material.dart';
import 'package:meowlish/core/utils/size_utils.dart';
import 'package:meowlish/network/network.dart';

import '../../data/models/accounts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Account? account = Account();

  @override
  void initState() {
    super.initState();
    fetchAccountData();
  }

  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          '11111\$',
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
                      "Recent Transactions",
                      style: TextStyle(
                          color: Color(0xffff9300),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        listTile(Icons.shopping_cart, Colors.white, "Shopping", "Buying new clothes", 13.66),
                        listTile(Icons.shopping_cart, Colors.white, "Shopping", "Buying new clothes", 13.66),
                        listTile(Icons.shopping_cart, Colors.white, "Shopping", "Buying new clothes", 13.66),
                        listTile(Icons.shopping_cart, Colors.white, "Shopping", "Buying new clothes", 13.66),
                        listTile(Icons.shopping_cart, Colors.white, "Shopping", "Buying new clothes", 13.66),
                        listTile(Icons.shopping_cart, Colors.white, "Shopping", "Buying new clothes", 13.66),
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget listTile(
    IconData icon, Color color, String type, String tittle, double value) {
  return InkWell(
    onTap: (){

    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xbbff9300), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xffff9300), borderRadius: BorderRadius.circular(8)),
            child: Icon(
              icon,
              size: 32,
              color: color,
            ),
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
                Text(tittle, style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                )
                ),
              ],
            ),
          ),
          Text("$value\$",
              style: TextStyle(
              color: Colors.white,
              fontSize: 22
              ,fontWeight: FontWeight.bold))
        ],
      ),
    ),
  );
}
