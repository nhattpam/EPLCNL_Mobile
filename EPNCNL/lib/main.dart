import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meowlish/presentation/home_page/home_page.dart';
import 'package:meowlish/presentation/mentor_curiculum/mentor_curiculum.dart';
import 'package:meowlish/presentation/openscreen_screen/openscreen_screen.dart';
import 'package:meowlish/session/session.dart';

import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        // Use FutureBuilder to handle asynchronous initialization
        return FutureBuilder(
          future: _initializeSessionManager(),
          builder: (context, snapshot) {
            bool isLearner = SessionManager().getLearnerId()?.isNotEmpty ?? false;
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                theme: theme,
                title: 'MeowLish',
                debugShowCheckedModeBanner: false,
                home: isLearner
                        ? SessionManager().getLearnerId().toString() != "null"
                          ? HomePage()
                          : OpenscreenScreen()
                        : SessionManager().getTutorId().toString() != "null"
                          ? MentorCuriculum()
                          : OpenscreenScreen()
                        ,
                // initialRoute: AppRoutes.openscreenScreen,
                routes: AppRoutes.routes,
              );
            } else {
              // Display a loading indicator while initializing
              return CircularProgressIndicator();
            }
          },
        );
      },
    );
  }

  // Asynchronously initialize the session manager
  Future<void> _initializeSessionManager() async {
    final sessionManager = SessionManager();
    await sessionManager.init();
  }
}
