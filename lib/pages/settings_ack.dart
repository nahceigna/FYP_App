import 'package:flutter/material.dart';

class Acknowledgements extends StatefulWidget {
  const Acknowledgements({Key? key}) : super(key: key);

  @override
  _AcknowledgementsState createState() => _AcknowledgementsState();
}

class _AcknowledgementsState extends State<Acknowledgements> {
  GestureDetector buildSettingTile(
      BuildContext context, String title, String route) {
    return GestureDetector(
      onTap: (() {
        /// navigate to respective pages
        Navigator.pushNamed(context, route);
      }),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: 45,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF343A40)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// background colour
      backgroundColor: const Color(0xFFE9ECEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        // elevation: 0,
        title: const Text('Acknowledgements',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            )),
      ),

      body: SafeArea(
        child: ListView(
          children: <Widget>[
            buildSettingTile(context, 'Loading Animation Widget',
                '/settings/ack/loading_animation'),
            buildSettingTile(
                context, 'Cupertino Icons', '/settings/ack/cupertino_icons'),
            buildSettingTile(
                context, 'Flutter Markdown', '/settings/ack/flutter_markdown'),
            buildSettingTile(context, 'Http', '/settings/ack/http'),
            buildSettingTile(context, 'Intl', '/settings/ack/intl'),
            buildSettingTile(
                context, 'Sync Flutters Charts', '/settings/ack/syncfusion'),
            buildSettingTile(context, 'Flutter Web Frame',
                '/settings/ack/flutter_web_frame'),
          ],
        ),
      ),
    );
  }
}
