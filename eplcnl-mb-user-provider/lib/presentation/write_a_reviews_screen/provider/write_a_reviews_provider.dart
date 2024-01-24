import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/write_a_reviews_screen/models/write_a_reviews_model.dart';

/// A provider class for the WriteAReviewsScreen.
///
/// This provider manages the state of the WriteAReviewsScreen, including the
/// current writeAReviewsModelObj
class WriteAReviewsProvider extends ChangeNotifier {
  TextEditingController writeAnythingAboutProductController =
      TextEditingController();

  WriteAReviewsModel writeAReviewsModelObj = WriteAReviewsModel();

  @override
  void dispose() {
    super.dispose();
    writeAnythingAboutProductController.dispose();
  }
}
