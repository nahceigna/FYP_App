import 'package:flutter/material.dart';
import 'package:fyp_app/acks/ack_cupertino_icons.dart';
import 'package:fyp_app/acks/ack_flutter_markdown.dart';
import 'package:fyp_app/acks/ack_flutter_web_frame.dart';
import 'package:fyp_app/acks/ack_http.dart';
import 'package:fyp_app/acks/ack_intl.dart';
import 'package:fyp_app/acks/ack_loading_widget.dart';
import 'package:fyp_app/acks/ack_syncfusion.dart';
import 'package:fyp_app/pages/homepage.dart';
import 'package:fyp_app/pages/loading.dart';
import 'package:fyp_app/pages/mainpage.dart';
import 'package:fyp_app/pages/map.dart';
import 'package:fyp_app/pages/onboarding.dart';
import 'package:fyp_app/pages/settings.dart';
import 'package:fyp_app/pages/settings_aboutus.dart';
import 'package:fyp_app/pages/settings_ack.dart';
import 'package:fyp_app/pages/settings_privacy.dart';

Map<String, Widget Function(BuildContext)> appRoute() {
  return {
    '/loading': (context) => const Loading(),
    '/main': (context) => const MainPage(),
    '/home': (context) => const Homepage(),
    '/settings': (context) => const Settings(),
    '/map': (context) => const Mappage(),
    '/settings/aboutus': (context) => const AboutUs(),
    '/settings/ack': (context) => const Acknowledgements(),
    '/settings/privacy': (context) => const PrivacyTerms(),
    '/settings/tutorial': (context) => const OnBoarding(showHome: true),
    '/settings/ack/loading_animation': (context) =>
        const LoadingAnimationWidget(),
    '/settings/ack/cupertino_icons': (context) => const CupertinoIcons(),
    '/settings/ack/flutter_markdown': (context) => const FlutterMarkdown(),
    '/settings/ack/http': (context) => const HttpPackage(),
    '/settings/ack/intl': (context) => const IntlPackage(),
    '/settings/ack/syncfusion': (context) => const Syncfusion(),
    '/settings/ack/flutter_web_frame': (context) => const FlutterWebFrame(),
  };
}
