import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/my_course_certificate_screen/models/my_course_certificate_model.dart';

/// A provider class for the MyCourseCertificateScreen.
///
/// This provider manages the state of the MyCourseCertificateScreen, including the
/// current myCourseCertificateModelObj
class MyCourseCertificateProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  MyCourseCertificateModel myCourseCertificateModelObj =
      MyCourseCertificateModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
