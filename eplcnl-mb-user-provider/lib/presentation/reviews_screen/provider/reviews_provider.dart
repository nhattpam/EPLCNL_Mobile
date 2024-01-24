import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/reviews_screen/models/reviews_model.dart';
import '../models/coursereviewlist_item_model.dart';
import '../models/categorylist1_item_model.dart';

/// A provider class for the ReviewsScreen.
///
/// This provider manages the state of the ReviewsScreen, including the
/// current reviewsModelObj

// ignore_for_file: must_be_immutable
class ReviewsProvider extends ChangeNotifier {
  ReviewsModel reviewsModelObj = ReviewsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
