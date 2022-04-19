import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class FlutterWebFrame extends StatefulWidget {
  const FlutterWebFrame({Key? key}) : super(key: key);

  @override
  _FlutterWebFrameState createState() => _FlutterWebFrameState();
}

class _FlutterWebFrameState extends State<FlutterWebFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text('Flutter Web Frame',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            )),
      ),
      backgroundColor: const Color(0xFFE9ECEF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: Future.delayed(const Duration(milliseconds: 150))
                      .then((value) {
                    return rootBundle.loadString('assets/flutter_web_frame.md');
                  }),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data.toString());
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
