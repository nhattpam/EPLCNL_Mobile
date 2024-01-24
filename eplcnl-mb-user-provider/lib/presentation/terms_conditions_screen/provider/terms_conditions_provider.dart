import 'package:flutter/material.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/presentation/terms_conditions_screen/models/terms_conditions_model.dart';

/// A provider class for the TermsConditionsScreen.
///
/// This provider manages the state of the TermsConditionsScreen, including the
/// current termsConditionsModelObj
class TermsConditionsProvider extends ChangeNotifier {
  TermsConditionsModel termsConditionsModelObj = TermsConditionsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
