/// import library
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// background colour
      backgroundColor: const Color(0xFFE9ECEF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0), // background colour
        title: const Text('About us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            )),
      ),

      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30.0),
            const SizedBox(
                height: 120,
                width: 120,
                child: Image(image: AssetImage('images/icon.png'))),
            aboutUsTitle('Supervisor'),
            aboutUsContent('Professor SONG Sheng Hui'),
            aboutUsTitle('Developer'),
            aboutUsContent('CHAN Cheuk Chee'),
            aboutUsContent('CHONG Kai Ching'),
            aboutUsTitle('Designer'),
            aboutUsContent('CHAN Cheuk Chee'),
          ],
        ),
      ),
    );
  }
}

/// function for building title
Widget aboutUsTitle(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Center(
      child: Text(title,
          style: const TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          )),
    ),
  );
}

/// function for building content
Widget aboutUsContent(String text) {
  return Center(
    child: Text(text, style: const TextStyle(fontSize: 17.0)),
  );
}
