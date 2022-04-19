/// import libraries
import 'package:flutter/material.dart';
import 'package:fyp_app/pages/loading.dart';
import 'package:fyp_app/pages/onboarding.dart';
import 'package:fyp_app/routes.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:fyp_app/scroll_behaviour.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final reference = await SharedPreferences.getInstance();
  final showHome = reference.getBool('showHome') ?? false;

  runApp(FlutterWebFrame(
      maximumSize: const Size(475.0, 812.0), // Maximum size
      backgroundColor: Colors.grey, // Background color/white space
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // hide the debugger banner
          title: "Finder", // change the app name in web
          theme: ThemeData(
            /// Set default font family and textTheme
            fontFamily: 'NotoSans',
            textTheme: const TextTheme(
                bodyMedium:
                    TextStyle(fontSize: 18.0, color: Color(0xFF343A40))),
          ),
          scrollBehavior: CustomScrollBehavior(),

          /// Allow onboarding only shown when first launched
          home: showHome ? const Loading() : OnBoarding(showHome: showHome),
          routes: appRoute(),
        );
      }));
}
