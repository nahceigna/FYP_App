/// import libraries
import 'package:flutter/material.dart';

/// List of locatons for dropdown menu
final List<String> locations = [
  'Overall',
  '1/F',
  'G/F',
  'LG1',
  'LG3',
  'LG4',
];

String selectedLocation = "Overall";

/// Build dropdown menu
DropdownMenuItem<String> buildLocationMenuItem(String location) =>
    DropdownMenuItem(
      value: location,
      child: Text(
        location,
        style: const TextStyle(fontSize: 17.0),
      ),
    );
