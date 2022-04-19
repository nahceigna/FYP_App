/// import library
import 'package:flutter/material.dart';

/// display number of people block
Widget numberOfPeople(int occupancy) {
  return Flexible(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('$occupancy', // $ is needed to convert variable into text
            style: const TextStyle(
                color: Color(0xFF343A40),
                fontSize: 40.0,
                fontWeight: FontWeight.w800)),
        const Text('people are in the library',
            style: TextStyle(color: Color(0xFF343A40), fontSize: 17.0)),
      ],
    ),
  );
}
