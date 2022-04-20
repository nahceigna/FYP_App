import 'package:flutter/material.dart';
import 'situation.dart';

/// Class SituationCard, display status
class SituationCard extends StatelessWidget {
  // variable
  final Situation state;
  final String time;

  //Constructor
  const SituationCard({Key? key, required this.state, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Plan your library visit',
                style: TextStyle(
                    color: Color(0xFF343A40),
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700)),
            const Divider(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Icon(Icons.search,
                      color: Color(state.iconColour), size: 35.0),
                  const SizedBox(width: 10.0),
                  const Text('Live at ', style: TextStyle(fontSize: 17.0)),
                  Text(time, style: const TextStyle(fontSize: 17.0)),
                  const Text(': ', style: TextStyle(fontSize: 17.0)),
                  Text(state.message, style: const TextStyle(fontSize: 17.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
