import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:intl/intl.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/data/models/profilecertificates.dart';
import 'package:meowlish/network/network.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/indox_chats_page/indox_chats_page.dart';
import 'package:meowlish/presentation/my_course_completed_page/my_course_completed_page.dart';
import 'package:meowlish/presentation/profiles_page/profiles_page.dart';
import 'package:meowlish/presentation/transactions_page/transactions_page.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:pdfx/pdfx.dart';

import '../../data/models/accounts.dart';

class MyCourseCertificateScreen extends StatefulWidget {
  final String profileId;
  const MyCourseCertificateScreen({super.key, required this.profileId});

  @override
  State<MyCourseCertificateScreen> createState() => _MyCourseCertificateScreenState();
}

class _MyCourseCertificateScreenState extends State<MyCourseCertificateScreen> {
  late PdfControllerPinch pdfControllerPinch;
  late ProfileCertificate? profile = ProfileCertificate();
  int _currentIndex = 1;
  int totalPageCount = 0,currentPage = 1;
  bool isLoadingPdf = true;
  @override
  void initState() {
    super.initState();
    fetchProfileId();
  }

  void openPdf() {
    final document = PdfDocument.openData(InternetFile.get(profile?.certificate?.description ?? ''));
    pdfControllerPinch = PdfControllerPinch(document: document);
    isLoadingPdf = false;
  }

  Future<void> fetchProfileId() async {
    ProfileCertificate acc = await Network.getProfileCertificate(widget.profileId);

    setState(() {
      // Set the list of pet containers in your state
      profile = acc;
      openPdf();
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: 300,
              height: 100, // Add margin
              child: Text(
                'Certificate',
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
        backgroundColor: Colors.white,
        body: isLoadingPdf ? Center(child: Container(child: CircularProgressIndicator(),),) : Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Total Pages: ${totalPageCount}'),
                IconButton(
                    onPressed: () {
                      pdfControllerPinch.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: Icon(Icons.arrow_back)),
                Text('Current Page: ${currentPage}'),
                IconButton(
                    onPressed: () {
                      pdfControllerPinch.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: Icon(Icons.arrow_forward))
              ],
            ),
            Expanded(
                child: PdfViewPinch(
                  scrollDirection: Axis.vertical,
                  controller: pdfControllerPinch,
                  onDocumentLoaded: (doc) {
                    setState(() {
                      totalPageCount = doc.pagesCount;
                    });
                  },
                  onPageChanged: (page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyCourseCompletedPage()),
            );
          }
          if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => IndoxChatsPage()),
            );
          }
          if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TransactionsPage()),
            );
          }
          if (index == 4) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProfilesPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedFontSize: 12,
        selectedLabelStyle: CustomTextStyles.labelLargeGray700,
        selectedItemColor: Color(0xbbff9300),
        unselectedItemColor: Color(0xffff9300),
      ),

      ),
    );
  }

  /// Section Widget
  Widget _buildDownloadCertificate(BuildContext context) {
    return CustomElevatedButton(
      text: "Download Certificate",
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 53.v,
      ),
      rightIcon: Container(
        padding: EdgeInsets.fromLTRB(14.h, 16.v, 12.h, 14.v),
        margin: EdgeInsets.only(left: 30.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(
            24.h,
          ),
        ),
        child: CustomImageView(
          imagePath: ImageConstant.imgFill1Primary,
          height: 17.v,
          width: 21.h,
        ),
      ),
    );
  }
}
