/// import libraries
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class OccupancyDataJSON {
  /// variables
  int ug1 = 0;
  int gf = 0;
  int lg1 = 0;
  int lg3 = 0;
  int lg4 = 0;
  int occupied = 0;
  int available = 3217;
  int capacity = 3217;
  String hour = "hour"; // hour of that location
  String updateTime = "time";

  Future<void> getOccupancy() async {
    try {
      /// the endpoint of the data
      Response response = await get(
        Uri.parse('https://061239230208.ctinets.com/api/library/floors'),
      );

      /// Decode the json String into a map
      Map<String, dynamic> data = jsonDecode(response.body);

      DateTime now = DateTime.now();

      /// Set the time and date property
      hour = DateFormat.j().format(now);
      updateTime = DateFormat.yMd().add_Hms().format(now);

      /// update the data
      ug1 = data['UG1'] > 0 ? data['UG1'] : ug1;
      gf = data['G'] > 0 ? data['G'] : gf;
      lg1 = data['LG1'] > 0 ? data['LG1'] : lg1;
      lg3 = data['LG3'] > 0 ? data['LG3'] : lg3;
      lg4 = data['LG4'] > 0 ? data['LG4'] : lg4;
      occupied = ug1 + gf + lg1 + lg3 + lg4;
      if (occupied > capacity) {
        occupied = capacity;
      }
      available -= occupied;
      debugPrint('Read GetOccupancy data');
    } catch (e) {
      /// Used to check error when debugging
      debugPrint('Caught error: $e');

      /// Set variables to 0
      ug1 = 0;
      gf = 0;
      lg1 = 0;
      lg3 = 0;
      lg4 = 0;
    }
  }
}
