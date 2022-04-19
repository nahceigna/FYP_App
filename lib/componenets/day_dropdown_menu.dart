/// import libraries
import 'package:flutter/material.dart';

/// Options for day dropdown menu
final List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

String? selectedDay;

/// Build the dropdown menu
DropdownMenuItem<String> buildDayMenuItem(String day) => DropdownMenuItem(
      value: day,
      child: Text(
        day,
        style: const TextStyle(fontSize: 17.0),
      ),
    );
