import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class LoadingAnimationWidget extends StatefulWidget {
  const LoadingAnimationWidget({Key? key}) : super(key: key);

  @override
  _LoadingAnimationWidgetState createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text('Loading Animation Widget',
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
                    return rootBundle
                        .loadString('assets/loading_animation_widget.md');
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
