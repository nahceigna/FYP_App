/// import libraries
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

/// Access world time from the internet
class WorldTime {
  /// variables
  late String time; // time of that location
  late String date; // date of that location
  late String hour; // hour of that location
  late String day; // day of that location
  late String updateTime;

  // Constructor
  WorldTime();

  Future<void> getTime() async {
    try {
      /// the endpoint of the data
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Hong_Kong'));

      /// Decode the json String into a map
      Map<String, dynamic> data = jsonDecode(response.body);

      /// get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      /// Create DateTime object
      DateTime now = DateTime.parse(datetime);

      /// Convert to location timezone
      now = now.add(Duration(hours: int.parse(offset)));

      /// Set the time and date property
      // time = DateFormat.Hm().format(now); // no seconds
      time = DateFormat.Hms().format(now);
      date = DateFormat.yMMMMd().format(now);
      hour = DateFormat.j().format(now);
      day = DateFormat.E().format(now);
      updateTime = DateFormat.yMd().add_Hms().format(now);
      debugPrint('Read GetTime data');
    } catch (e) {
      /// Used to check error when debugging
      debugPrint('caught error: $e');

      /// Set variables to string
      time = 'Could not get time data';
      date = 'Could not get date data';
      hour = 'Could not get hour data';
      day = 'Could not get day data';
      updateTime = 'Could not get update time data';
    }
  }
}
