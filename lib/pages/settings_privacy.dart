import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyTerms extends StatefulWidget {
  const PrivacyTerms({Key? key}) : super(key: key);

  @override
  _PrivacyTermsState createState() => _PrivacyTermsState();
}

class _PrivacyTermsState extends State<PrivacyTerms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9ECEF),

      /// background colour
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text('Privacy and Terms',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: Future.delayed(const Duration(milliseconds: 150))
                      .then((value) {
                    return rootBundle.loadString('assets/privacy_policy.md');
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
