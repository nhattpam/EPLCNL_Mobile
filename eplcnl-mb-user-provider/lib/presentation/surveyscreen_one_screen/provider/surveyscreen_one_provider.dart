import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/surveyscreen_one_screen/models/surveyscreen_one_model.dart';

/// A provider class for the SurveyscreenOneScreen.
///
/// This provider manages the state of the SurveyscreenOneScreen, including the
/// current surveyscreenOneModelObj

// ignore_for_file: must_be_immutable
class SurveyscreenOneProvider extends ChangeNotifier {
  TextEditingController newsnewspaperblogController = TextEditingController();

  TextEditingController appStorevalueController = TextEditingController();

  TextEditingController facebookInstagramController = TextEditingController();

  TextEditingController googlevalueController = TextEditingController();

  TextEditingController tiktokvalueController = TextEditingController();

  TextEditingController friendFamilyvalueController = TextEditingController();

  TextEditingController youtubevalueController = TextEditingController();

  SurveyscreenOneModel surveyscreenOneModelObj = SurveyscreenOneModel();

  @override
  void dispose() {
    super.dispose();
    newsnewspaperblogController.dispose();
    appStorevalueController.dispose();
    facebookInstagramController.dispose();
    googlevalueController.dispose();
    tiktokvalueController.dispose();
    friendFamilyvalueController.dispose();
    youtubevalueController.dispose();
  }
}
