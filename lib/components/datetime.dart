import 'package:flutter/material.dart';

/// Widget for displaying time
Widget timeText(String time) {
  return Text(
    time,
    style: const TextStyle(
        color: Color(0xFF343A40), fontSize: 50.0, fontWeight: FontWeight.w700),
  );
}

/// Widget for displaying date
Widget dateText(String date) {
  return Text(
    date,
    style: const TextStyle(
        color: Color(0xFF343A40), fontSize: 20.0, fontWeight: FontWeight.w700),
  );
}

/// Widget for displaying date
Widget lastUpdated(String updateTime) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const Text(
        'Last updated: ',
        style: TextStyle(color: Color(0xFF343A40), fontSize: 12.0),
      ),
      Text(
        updateTime,
        style: const TextStyle(color: Color(0xFF343A40), fontSize: 12.0),
      ),
    ],
  );
}
