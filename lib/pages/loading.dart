import 'package:flutter/material.dart';
import 'package:fyp_app/services/occupancy_data.dart';
import 'package:fyp_app/services/world_time.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /// Get data from server
  /// async, to make order; await, need to wait for this first

  void setupData() async {
    /// Get data online
    /// Get online clock
    WorldTime timeData = WorldTime();
    await timeData.getTime();

    /// get data online
    OccupancyDataJSON occupancy = OccupancyDataJSON();
    await occupancy.getOccupancy();

    /// Navigate to homepage
    Navigator.pushReplacementNamed(
      context,
      '/main',
      arguments: <String, dynamic>{
        'time': timeData.time,
        'date': timeData.date,
        'hour': timeData.hour,
        'day': timeData.day,
        'updateTime': timeData.updateTime,
        'occupied': occupancy.occupied,
        'available': occupancy.available,
      },
    );
  }

  /// Do these when app is initially opened
  @override
  void initState() {
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.inkDrop(
              color: const Color(0xFF1565C0),
              size: 50.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Loading...',
              style: TextStyle(
                color: Color(0xFF343A40),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
